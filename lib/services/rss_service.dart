import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;
import 'package:html/parser.dart' as html;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../models/article.dart';

class RssService {
  final String rssUrl = 'https://www.djjb.de/index.rss';
  
  Future<List<Article>> fetchArticles() async {
    // Initialize localization data for German
    await initializeDateFormatting('de_DE', null);
    
    try {
      late http.Response response;
      
      if (kIsWeb) {
        // For web, use a CORS proxy
        final corsProxyUrl = 'https://api.allorigins.win/raw?url=${Uri.encodeComponent(rssUrl)}';
        response = await http.get(Uri.parse(corsProxyUrl));
      } else {
        // For mobile/desktop, direct request works fine
        response = await http.get(Uri.parse(rssUrl));
      }
      
      if (response.statusCode == 200) {
        return _parseRssFeed(response.body);
      } else {
        throw Exception('Failed to load RSS feed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching RSS feed: $e');
    }
  }
  
  List<Article> _parseRssFeed(String xmlString) {
    final document = xml.XmlDocument.parse(xmlString);
    final items = document.findAllElements('item');
    
    return items.map((item) {
      // Extract title and link
      final title = _getElementText(item, 'title');
      final link = _getElementText(item, 'link');
      final pubDateStr = _getElementText(item, 'pubDate');
      
      // Convert date to German format
      String pubDate = pubDateStr;
      try {
        if (pubDateStr.isNotEmpty) {
          final dateTime = DateFormat('EEE, dd MMM yyyy HH:mm:ss Z', 'en_US').parse(pubDateStr);
          pubDate = DateFormat('dd.MM.yyyy HH:mm', 'de_DE').format(dateTime);
        }
      } catch (e) {
        print('Error converting date: $e');
      }
      
      // Extract description and handle HTML content
      String description = _getElementText(item, 'description');
      String imageUrl = '';
      
      // Method 1: Check for enclosure tags (common in RSS feeds for media)
      final enclosures = item.findElements('enclosure');
      if (enclosures.isNotEmpty) {
        for (final enclosure in enclosures) {
          final type = enclosure.getAttribute('type');
          if (type != null && type.startsWith('image/')) {
            imageUrl = enclosure.getAttribute('url') ?? '';
            if (imageUrl.isNotEmpty) break;
          }
        }
      }
      
      // Method 2: Check for media:content tags
      if (imageUrl.isEmpty) {
        final mediaContents = item.findElements('media:content')
            .followedBy(item.findElements('content'));
        for (final media in mediaContents) {
          final type = media.getAttribute('type');
          if (type != null && type.startsWith('image/')) {
            imageUrl = media.getAttribute('url') ?? '';
            if (imageUrl.isNotEmpty) break;
          }
        }
      }
      
      // Method 3: Check for content:encoded tag which contains CDATA with image
      if (imageUrl.isEmpty) {
        final contentEncoded = _getElementText(item, 'content:encoded');
        if (contentEncoded.isNotEmpty) {
          final contentDoc = html.parse(contentEncoded);
          final imgElements = contentDoc.getElementsByTagName('img');
          
          if (imgElements.isNotEmpty && imgElements.first.attributes.containsKey('src')) {
            imageUrl = imgElements.first.attributes['src'] ?? '';
          }
        }
      }
      
      // Method 4: Look for image URLs in the description (fallback)
      if (imageUrl.isEmpty && description.isNotEmpty) {
        final descriptionDoc = html.parse(description);
        final imgElements = descriptionDoc.getElementsByTagName('img');
        
        if (imgElements.isNotEmpty && imgElements.first.attributes.containsKey('src')) {
          imageUrl = imgElements.first.attributes['src'] ?? '';
        }
      }
      
      // Debug: Print to console to check if images are found
      print('Article "$title" - Image URL: $imageUrl');
      
      // Clean the description text (remove HTML tags)
      if (description.isNotEmpty) {
        final textContent = html.parse(description).documentElement?.text ?? '';
        description = textContent.trim();
      }
      
      return Article(
        title: title,
        link: link,
        description: description,
        imageUrl: imageUrl,
        pubDate: pubDate,
      );
    }).toList();
  }
  
  String _getElementText(xml.XmlElement item, String elementName) {
    final element = item.findElements(elementName).firstOrNull;
    return element?.innerText ?? '';
  }
}
