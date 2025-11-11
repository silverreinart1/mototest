# MotoRadar Flutter App - Complete Setup Guide

A production-ready motorcycle riding community app with Firebase authentication, ride tracking, training modules, and community features.

## 🎯 Features

✅ **Firebase Email/Password Authentication** - Secure login & signup
✅ **Home Dashboard** - Recent rides, rider squad, group rides, training modules
✅ **Ride Recording** - GPS tracking with live stats
✅ **Community Rides** - Browse and join group rides
✅ **User Profile** - Statistics, bike maintenance logs, ratings
✅ **Training Modules** - Interactive driving training with progress tracking
✅ **Exam Preparation** - License exam prep with study materials
✅ **Real-time Database** - Firebase Realtime DB for data sync
✅ **Aggressive UI** - Sporty orange & dark theme

## 📱 Tech Stack

- **Flutter** - Cross-platform mobile development
- **Dart** - Programming language
- **Firebase** - Backend (Auth, Realtime DB, Storage)
- **Provider** - State management
- **Google Fonts** - Typography

## 🚀 Quick Start

### Prerequisites

- Flutter SDK (3.0.0+)
- Android Studio or VS Code
- Firebase account
- Git

### 1. Clone & Setup Project

```bash
git clone <your-repo>
cd motoradar
flutter pub get
```

### 2. Firebase Configuration

**Follow the detailed guide in `FIREBASE_SETUP.md`**

Key steps:

1. Create Firebase project on console.firebase.google.com
2. Add Android app with package `com.motoradar.app`
3. Download `google-services.json` → save to `android/app/`
4. Enable Email/Password authentication
5. Create Realtime Database
6. Update `lib/firebase_options.dart` with credentials

### 3. Run the App

```bash
# On Android Emulator
flutter run

# On physical device
flutter devices
flutter run -d <device_id>

# Release build
flutter build apk --release
```

## 📁 Project Structure

```
motoradar/
├── lib/
│   ├── main.dart                          # App entry point with Firebase init
│   ├── firebase_options.dart              # Firebase credentials
│   ├── screens/
│   │   ├── login_screen.dart              # Email/password login
│   │   ├── signup_screen.dart             # User registration
│   │   ├── home_screen.dart               # Dashboard with training
│   │   ├── participate_screen.dart        # Community rides
│   │   ├── map_screen.dart                # Ride recording & GPS
│   │   ├── profile_screen.dart            # User profile & stats
│   │   └── exam_prep_screen.dart          # Exam preparation
│   ├── widgets/
│   │   ├── recent_ride_card.dart          # Ride display card
│   │   ├── rider_avatar.dart              # User avatars
│   │   ├── ride_event_card.dart           # Event cards
│   │   └── training_module.dart           # Training exercises
│   ├── models/
│   │   ├── rider_model.dart               # Rider data model
│   │   └── ride_event_model.dart          # Ride event model
│   ├── services/
│   │   └── firebase_service.dart          # Firebase operations
│   ├── providers/
│   │   └── user_provider.dart             # User state management
│   └── theme/
│       └── theme.dart                     # App theme & colors
├── android/
│   ├── app/
│   │   ├── google-services.json           # Firebase config
│   │   ├── build.gradle                   # Gradle config
│   │   └── src/main/AndroidManifest.xml   # App manifest
│   └── build.gradle                       # Project gradle
├── pubspec.yaml                           # Dependencies
├── FIREBASE_SETUP.md                      # Firebase guide
└── README_FLUTTER.md                      # This file
```

## 🔐 Authentication Flow

1. **Login Screen** - Email/password login
2. **Sign Up Screen** - Create new account
3. **Firebase Auth** - Secure authentication
4. **User Provider** - Manages auth state
5. **Home Screen** - Redirected on successful auth

### Firebase Auth Errors Handled

- Weak password
- Email already in use
- Invalid email
- User not found
- Wrong password
- Too many login attempts

## 💾 Database Structure

### Realtime Database

```
motoradar/
├── users/
│   └── {uid}/
│       ├── uid
│       ├── email
│       ├── fullName
│       ├── createdAt
│       ├── totalRides (number)
│       ├── totalDistance (km)
│       ├── rating (1-5)
│       └── level (1-10)
└── rides/
    └── {rideId}/
        ├── userId
        ├── title
        ├── location
        ├── distance
        ├── avgSpeed
        ├── duration
        ├── createdAt
        └── ...
```

## 🎨 UI Theme

**Colors:**

- Primary Orange: `#FF6B35`
- Dark Background: `#1A1A1A`
- Charcoal: `#3A3A3A`
- Accent: `#FFA500`
- White: `#FFFFFF`

**Fonts:**

- Poppins (Body text)
- Playfair Display (Headers)

## 📱 Screens Overview

### Login Screen

- Email/password input
- Sign up link
- Error handling
- Loading state

### Sign Up Screen

- Name, email, password fields
- Password confirmation
- Validation
- Firebase registration

### Home Screen

- Welcome header with flame icon
- Recent ride card (42.5 km, 78 km/h, 32 min)
- Riding squad with 6 avatars & ratings
- Group rides section
- Training modules with progress
- Leaderboard teaser

### Participate Screen

- My completed rides
- Available group rides to join
- Ride details (location, difficulty, time)

### Map Screen

- Map view placeholder
- Start/Stop recording button
- Live stats display (distance, speed, time)
- Recent ride recordings

### Profile Screen

- User avatar & info
- 4 key statistics (rides, distance, speed, days)
- Bike maintenance logs
- Service history
- Status indicators
- Sign out button

### Exam Prep Screen

- License category info
- Exam date countdown
- Study progress by topic
- Practice tests
- Study tips

## 🔄 State Management

Using **Provider** for state management:

```dart
// Access user data
final user = Provider.of<UserProvider>(context);
user.currentUser      // Firebase User object
user.userProfile      // User data from DB
user.isAuthenticated  // Auth state
user.isLoading        // Loading state
user.error            // Error messages

// Sign in/up/out
await user.signIn(email, password);
await user.signUp(email, password, fullName);
await user.signOut();
```

## 🛠️ Firebase Service Methods

```dart
// Authentication
FirebaseService.signUpWithEmail(email, password, fullName)
FirebaseService.signInWithEmail(email, password)
FirebaseService.signOut()

// User Profile
FirebaseService.getUserProfile(uid)
FirebaseService.updateUserRating(uid, rating)

// Rides
FirebaseService.saveRide(userId, rideData)
FirebaseService.getAllRides()
```

## 🧪 Testing

### Test Login

1. Sign up: `test@example.com` / `password123`
2. Sign in with same credentials
3. View profile and ride data
4. Record a test ride
5. Sign out

### Test Validation

- Empty fields → Error message
- Weak password → Error message
- Password mismatch → Error message
- Duplicate email → Error message

## 📋 Firebase Database Rules

```json
{
  "rules": {
    "users": {
      "$uid": {
        ".read": "$uid === auth.uid",
        ".write": "$uid === auth.uid"
      }
    },
    "rides": {
      ".read": "auth != null",
      "$rideId": {
        ".write": "root.child('rides').child($rideId).child('userId').val() === auth.uid || !data.exists()"
      }
    }
  }
}
```

## 🐛 Troubleshooting

### Firebase Not Initializing

```
Error: Failed to initialize Firebase
Solution: Check google-services.json location and firebase_options.dart credentials
```

### Auth State Not Updating

```
Error: User stays logged out after sign up
Solution: Ensure MultiProvider wraps MaterialApp and UserProvider is in providers
```

### Database Write Denied

```
Error: Permission denied in database
Solution: Check database rules and ensure user is authenticated
```

### Build Failures

```
Solution: Run these commands
$ flutter clean
$ flutter pub get
$ flutter pub upgrade
$ flutter run
```

## 🚀 Deployment

### Build APK

```bash
flutter build apk --release
# Output: build/app/outputs/flutter-apk/app-release.apk
```

### Build AAB (for Play Store)

```bash
flutter build appbundle --release
# Output: build/app/outputs/bundle/release/app-release.aab
```

### Upload to Play Store

1. Go to Google Play Console
2. Create app listing
3. Add app APK/AAB
4. Fill in description, screenshots, etc.
5. Submit for review

## 📚 Resources

- [Flutter Docs](https://flutter.dev/docs)
- [Firebase Flutter Setup](https://firebase.flutter.dev)
- [Dart Language](https://dart.dev)
- [Provider Package](https://pub.dev/packages/provider)
- [Google Maps Flutter](https://pub.dev/packages/google_maps_flutter)

## 📞 Support

For issues:

1. Check `FIREBASE_SETUP.md` for Firebase configuration
2. Review `Troubleshooting` section above
3. Check Firebase Console for auth/DB errors
4. Run `flutter doctor` to diagnose environment issues

## 📄 License

MIT License - Feel free to use this project for your own apps!

---

**Happy Riding! 🏍️**

For any questions or issues, refer to the Firebase setup guide and troubleshooting section above.
