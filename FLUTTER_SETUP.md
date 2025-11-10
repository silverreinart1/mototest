# MotoRadar Flutter App - Setup Guide

## Project Structure

```
motoradar/
├── lib/
│   ├── main.dart                 # App entry point
│   ├── screens/
│   │   ├── home_screen.dart      # Home/Dashboard screen
│   │   └── placeholder_screen.dart # Placeholder for other pages
│   ├── widgets/
│   │   ├── recent_ride_card.dart # Recent ride display card
│   │   ├── rider_avatar.dart     # Rider avatar component
│   │   └── ride_event_card.dart  # Group ride event card
│   ├── models/
│   │   ├── rider_model.dart      # Rider data model
│   │   └── ride_event_model.dart # Ride event data model
│   └── theme/
│       └── theme.dart            # MotoRadar theme & colors
├── android/                      # Android-specific configuration
├── pubspec.yaml                  # Flutter dependencies
└── README.md
```

## Prerequisites

Before running this app, you need to install Flutter:

1. **Download Flutter SDK** from https://flutter.dev/docs/get-started/install
2. **Extract to a suitable location** (e.g., ~/flutter)
3. **Add Flutter to PATH**:
   - On macOS/Linux: Add `export PATH="$PATH:~/flutter/bin"` to ~/.zshrc or ~/.bashrc
   - On Windows: Add `C:\flutter\bin` to System PATH
4. **Install Android Studio** from https://developer.android.com/studio
5. **Install Android SDK** via Android Studio (API level 21 or higher)

## Setup Instructions

### 1. Verify Flutter Installation
```bash
flutter doctor
```
This should show:
- ✓ Flutter (Channel stable)
- ✓ Android toolchain
- ✓ Android SDK

### 2. Get Dependencies
```bash
cd motoradar
flutter pub get
```

### 3. Configure Android (Android Only)

#### Option A: Using Android Emulator
```bash
# List available emulators
flutter emulators

# Launch emulator
flutter emulators --launch <emulator_name>

# Or create a new one via Android Studio
```

#### Option B: Using Physical Device
- Enable **Developer Mode** on your Android phone (tap Build Number 7 times in Settings > About Phone)
- Enable **USB Debugging** in Developer Options
- Connect via USB
- Verify connection:
  ```bash
  flutter devices
  ```

### 4. Run the App

#### On Emulator/Device:
```bash
flutter run
```

#### On Specific Device:
```bash
flutter devices                  # List available devices
flutter run -d <device_id>       # Run on specific device
```

#### Release Build:
```bash
flutter build apk --release
# APK will be in: build/app/outputs/flutter-apk/app-release.apk
```

## Features

✅ **Home Screen** - Recent rides with stats (distance, speed, duration)
✅ **Rider Squad** - Avatar grid with ratings and online status
✅ **Group Rides** - Upcoming events with difficulty levels
✅ **Bottom Navigation** - 5 navigation tabs with placeholder pages
✅ **Dark Theme** - Aggressive MotoRadar color scheme (Orange #FF6B35, Dark #1A1A1A)
✅ **Responsive Design** - Optimized for all Android screen sizes

## Color Scheme

- **Primary Orange**: #FF6B35
- **Dark Background**: #1A1A1A
- **Charcoal**: #3A3A3A
- **Accent**: #FFA500
- **White**: #FFFFFF

## Fonts

- **Poppins** - Body text and UI elements (via Google Fonts)
- **Playfair Display** - Not used in Flutter version (replaced with Poppins for consistency)

## Troubleshooting

### "Flutter SDK not found"
- Ensure Flutter is properly installed and in your PATH
- Run: `flutter --version`

### "Android SDK not found"
- Install Android Studio
- Run Android Studio once to complete setup
- Accept all SDK licenses: `flutter doctor --android-licenses`

### App crashes on startup
- Run: `flutter clean`
- Then: `flutter pub get`
- Finally: `flutter run`

### Permission issues on Android
- In `android/app/src/main/AndroidManifest.xml`, ensure permissions are set
- Restart the emulator/device

## Next Steps

To expand the app:

1. **Add Real Data** - Replace mock data with API calls
2. **Implement Navigation** - Add navigation between screens
3. **Add State Management** - Use Provider or GetX for state
4. **Add Local Database** - Use SQLite or Hive for offline storage
5. **Push Notifications** - Integrate Firebase Cloud Messaging

## Support & Resources

- Flutter Docs: https://flutter.dev/docs
- Flutter Pub Packages: https://pub.dev
- Android Studio Emulator: https://developer.android.com/studio/run/emulator

---

Happy riding! 🏍️
