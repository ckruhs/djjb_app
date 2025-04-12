# DJJB App

An application for reading news from the German Jiu Jitsu Federation (DJJB).

## Features

- Display of current news from the official DJJB RSS feed (https://www.djjb.de/index.rss)
- Clickable articles that lead to the full news on the DJJB website
- Support for various platforms: iOS, Android, macOS, Web

## Technical Details

The app was developed with Flutter and uses the following technologies:

- **HTTP**: For retrieving the RSS feed
- **XML**: For parsing the RSS feed content
- **HTML**: For extracting images and cleaning HTML content
- **Cached Network Image**: For efficient loading and caching of images
- **URL Launcher**: For opening articles in the web browser
- **Intl**: For formatting date and time in German format

## Installation and Execution

### Prerequisites

- Flutter SDK (Version 3.x or higher)
- Dart SDK (Version 3.x or higher)
- An IDE like VS Code or Android Studio

### Steps

1. Clone the repository:
   ```
   git clone https://github.com/ckruhs/djjb_app.git
   ```

2. Navigate to the project directory:
   ```
   cd djjb_app
   ```

3. Install the dependencies:
   ```
   flutter pub get
   ```

4. Start the app:
   ```
   flutter run
   ```

### Build for Different Platforms

- **macOS**: `flutter build macos --release`
- **iOS**: `flutter build ios --release`
- **Android**: `flutter build apk --release`
- **Web**: `flutter build web --release`

## Project Information

- **Version**: 1.0.0
- **Created**: April 2025
- **Developed with**: Flutter 3.29.2, Dart 3.7.2
- **Compatibility**: iOS 11+, Android 5.0+, macOS 10.14+, Web (modern browsers)
- **Repository**: https://github.com/ckruhs/djjb_app

