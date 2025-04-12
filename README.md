# DJJB News App

Eine Anwendung zum Lesen von Neuigkeiten des Deutschen Jiu Jitsu Bundes (DJJB).

## Funktionen

- Anzeige aktueller Nachrichten aus dem offiziellen RSS-Feed des DJJB (https://www.djjb.de/index.rss)
- Anklickbare Artikel, die zur vollständigen Nachricht auf der DJJB-Website führen
- Unterstützung für verschiedene Plattformen: iOS, Android, macOS, Web

## Technische Details

Die App wurde mit Flutter entwickelt und nutzt folgende Technologien:

- **HTTP**: Für das Abrufen des RSS-Feeds
- **XML**: Zum Parsen des RSS-Feed-Inhalts
- **HTML**: Zum Extrahieren von Bildern und Bereinigen von HTML-Inhalten
- **Cached Network Image**: Für effizientes Laden und Zwischenspeichern von Bildern
- **URL Launcher**: Zum Öffnen von Artikeln im Webbrowser
- **Intl**: Für die Formatierung von Datum und Uhrzeit im deutschen Format

## Installation und Ausführung

### Voraussetzungen

- Flutter SDK (Version 3.x oder höher)
- Dart SDK (Version 3.x oder höher)
- Eine IDE wie VS Code oder Android Studio

### Schritte

1. Clone das Repository:
   ```
   git clone https://github.com/ckruhs/djjb_app.git
   ```

2. Navigiere zum Projektverzeichnis:
   ```
   cd djjb_app
   ```

3. Installiere die Abhängigkeiten:
   ```
   flutter pub get
   ```

4. Starte die App:
   ```
   flutter run
   ```

### Build für verschiedene Plattformen

- **macOS**: `flutter build macos --release`
- **iOS**: `flutter build ios --release`
- **Android**: `flutter build apk --release`
- **Web**: `flutter build web --release`

## Projekt-Informationen

- **Version**: 1.0.0
- **Erstellt am**: April 2025
- **Entwickelt mit**: Flutter 3.29.2, Dart 3.7.2
- **Kompatibilität**: iOS 11+, Android 5.0+, macOS 10.14+, Web (moderne Browser)
- **Repository**: https://github.com/ckruhs/djjb_app
