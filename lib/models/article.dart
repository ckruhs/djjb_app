// Author: ckruhs (https://github.com/ckruhs)
// Created: April 2025
// DJJB News App - Article Model for displaying news entries

class Article {
  final String title;
  final String link;
  final String description;
  final String imageUrl;
  final String pubDate;
  
  Article({
    required this.title,
    required this.link,
    required this.description,
    required this.imageUrl,
    required this.pubDate,
  });
  
  factory Article.fromRss(Map<String, dynamic> rssItem) {
    return Article(
      title: rssItem['title'] ?? '',
      link: rssItem['link'] ?? '',
      description: rssItem['description'] ?? '',
      imageUrl: rssItem['imageUrl'] ?? '',
      pubDate: rssItem['pubDate'] ?? '',
    );
  }
}
