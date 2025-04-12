#!/bin/bash
# App Icon Generation Script for DJJB App
# This script generates app icons for all supported platforms
# Usage: Place your 1024x1024 icon as "original_icon.png" in project root and run this script

echo "DJJB App Icon Generator"
echo "======================="

# Verify the source icon exists
if [ ! -f "original_icon.png" ]; then
  echo "Error: original_icon.png not found in project root!"
  echo "Please place a 1024x1024 png file named 'original_icon.png' in the project root."
  exit 1
fi

# Create temporary directory for processing
echo "Creating temporary directory..."
mkdir -p /tmp/icon_generation
cp original_icon.png /tmp/icon_generation/original.png

# Generate iOS app icons
echo "Generating iOS icons..."
mkdir -p ios/Runner/Assets.xcassets/AppIcon.appiconset
sips -z 20 20 /tmp/icon_generation/original.png --out ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-20x20@1x.png
sips -z 40 40 /tmp/icon_generation/original.png --out ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-20x20@2x.png
sips -z 60 60 /tmp/icon_generation/original.png --out ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-20x20@3x.png
sips -z 29 29 /tmp/icon_generation/original.png --out ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-29x29@1x.png
sips -z 58 58 /tmp/icon_generation/original.png --out ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-29x29@2x.png
sips -z 87 87 /tmp/icon_generation/original.png --out ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-29x29@3x.png
sips -z 40 40 /tmp/icon_generation/original.png --out ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-40x40@1x.png
sips -z 80 80 /tmp/icon_generation/original.png --out ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-40x40@2x.png
sips -z 120 120 /tmp/icon_generation/original.png --out ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-40x40@3x.png
sips -z 120 120 /tmp/icon_generation/original.png --out ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-60x60@2x.png
sips -z 180 180 /tmp/icon_generation/original.png --out ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-60x60@3x.png
sips -z 76 76 /tmp/icon_generation/original.png --out ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-76x76@1x.png
sips -z 152 152 /tmp/icon_generation/original.png --out ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-76x76@2x.png
sips -z 167 167 /tmp/icon_generation/original.png --out ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-83.5x83.5@2x.png
sips -z 1024 1024 /tmp/icon_generation/original.png --out ios/Runner/Assets.xcassets/AppIcon.appiconset/Icon-App-1024x1024@1x.png
echo "✓ iOS icons generated"

# Generate Android icons
echo "Generating Android icons..."
mkdir -p android/app/src/main/res/mipmap-mdpi
mkdir -p android/app/src/main/res/mipmap-hdpi
mkdir -p android/app/src/main/res/mipmap-xhdpi
mkdir -p android/app/src/main/res/mipmap-xxhdpi
mkdir -p android/app/src/main/res/mipmap-xxxhdpi

# Regular icons
sips -z 48 48 /tmp/icon_generation/original.png --out android/app/src/main/res/mipmap-mdpi/ic_launcher.png
sips -z 72 72 /tmp/icon_generation/original.png --out android/app/src/main/res/mipmap-hdpi/ic_launcher.png
sips -z 96 96 /tmp/icon_generation/original.png --out android/app/src/main/res/mipmap-xhdpi/ic_launcher.png
sips -z 144 144 /tmp/icon_generation/original.png --out android/app/src/main/res/mipmap-xxhdpi/ic_launcher.png
sips -z 192 192 /tmp/icon_generation/original.png --out android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png

# Round icons (using same image since your logo is already circular)
sips -z 48 48 /tmp/icon_generation/original.png --out android/app/src/main/res/mipmap-mdpi/ic_launcher_round.png
sips -z 72 72 /tmp/icon_generation/original.png --out android/app/src/main/res/mipmap-hdpi/ic_launcher_round.png
sips -z 96 96 /tmp/icon_generation/original.png --out android/app/src/main/res/mipmap-xhdpi/ic_launcher_round.png
sips -z 144 144 /tmp/icon_generation/original.png --out android/app/src/main/res/mipmap-xxhdpi/ic_launcher_round.png
sips -z 192 192 /tmp/icon_generation/original.png --out android/app/src/main/res/mipmap-xxxhdpi/ic_launcher_round.png
echo "✓ Android icons generated"

# Generate macOS icons
echo "Generating macOS icons..."
mkdir -p macos/Runner/Assets.xcassets/AppIcon.appiconset
sips -z 16 16 /tmp/icon_generation/original.png --out macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_16.png
sips -z 32 32 /tmp/icon_generation/original.png --out macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_32.png
sips -z 64 64 /tmp/icon_generation/original.png --out macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_64.png
sips -z 128 128 /tmp/icon_generation/original.png --out macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_128.png
sips -z 256 256 /tmp/icon_generation/original.png --out macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_256.png
sips -z 512 512 /tmp/icon_generation/original.png --out macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_512.png
sips -z 1024 1024 /tmp/icon_generation/original.png --out macos/Runner/Assets.xcassets/AppIcon.appiconset/app_icon_1024.png
echo "✓ macOS icons generated"

# Generate Web icons
echo "Generating Web icons..."
mkdir -p web/icons
sips -z 192 192 /tmp/icon_generation/original.png --out web/icons/Icon-192.png
sips -z 512 512 /tmp/icon_generation/original.png --out web/icons/Icon-512.png
sips -z 16 16 /tmp/icon_generation/original.png --out web/favicon.png
sips -z 192 192 /tmp/icon_generation/original.png --out web/icons/Icon-maskable-192.png
sips -z 512 512 /tmp/icon_generation/original.png --out web/icons/Icon-maskable-512.png
echo "✓ Web icons generated"

# Generate Linux icon
echo "Generating Linux icon..."
sips -z 256 256 /tmp/icon_generation/original.png --out linux/app_icon.png
echo "✓ Linux icon generated"

# Generate Windows icon
echo "Generating Windows icon..."
mkdir -p windows/runner/resources
sips -z 256 256 /tmp/icon_generation/original.png --out windows/runner/resources/app_icon.png
echo "✓ Windows icon generated"

# Clean up
rm -rf /tmp/icon_generation
echo "✓ Temporary files cleaned up"

echo ""
echo "All app icons have been generated successfully!"
echo "Remember to test your app on each platform to ensure icons display correctly."
