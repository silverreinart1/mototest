# Firebase Setup for MotoRadar Flutter App

Follow these steps to set up Firebase for the MotoRadar app:

## Step 1: Create Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com)
2. Click "Create Project"
3. Name it "MotoRadar" and click "Continue"
4. Disable Google Analytics (optional) and create project
5. Wait for project to be created

## Step 2: Add Android App to Firebase

1. In Firebase Console, click "Add app" and select Android
2. Package name: `com.motoradar.app`
3. App nickname: `MotoRadar Android`
4. Click "Register app"
5. Download `google-services.json` file

## Step 3: Add google-services.json to Project

1. Place the downloaded `google-services.json` in: `android/app/`
2. The file should be at this path: `android/app/google-services.json`

## Step 4: Update Android Build Files

### Update `android/build.gradle`:

```gradle
buildscript {
  dependencies {
    classpath 'com.google.gms:google-services:4.3.15'
  }
}
```

### Update `android/app/build.gradle`:

Add at the bottom of the file:
```gradle
apply plugin: 'com.google.gms.google-services'
```

## Step 5: Update firebase_options.dart

1. Go to Firebase Console → Project Settings
2. Scroll to "Your apps" section and select your Android app
3. Copy these values and update `lib/firebase_options.dart`:

```dart
static const FirebaseOptions android = FirebaseOptions(
  apiKey: 'YOUR_API_KEY',
  appId: 'YOUR_APP_ID',
  messagingSenderId: 'YOUR_MESSAGING_SENDER_ID',
  projectId: 'YOUR_PROJECT_ID',
  databaseURL: 'YOUR_DATABASE_URL',
  storageBucket: 'YOUR_STORAGE_BUCKET',
);
```

## Step 6: Enable Firebase Services

In Firebase Console:

1. **Authentication**:
   - Go to Authentication → Sign-in method
   - Enable "Email/Password"

2. **Realtime Database**:
   - Go to Realtime Database
   - Create database in "Test mode"
   - Select region closest to you

3. **Storage** (optional):
   - Go to Storage
   - Create bucket in "Test mode"

## Step 7: Install Dependencies

```bash
cd motoradar
flutter pub get
```

## Step 8: Connect Device/Emulator

```bash
flutter devices
flutter run
```

## Database Rules (Realtime Database)

Set these rules in Firebase Console → Realtime Database → Rules:

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

## Testing the App

1. **Sign Up**: Create a new account with email and password
2. **Sign In**: Log in with your credentials
3. **Home Screen**: See your rides and training modules
4. **Record Ride**: Click "Start Recording" to track a ride
5. **Profile**: View your stats and bike maintenance logs

## Troubleshooting

### "Failed to initialize Firebase"
- Ensure `google-services.json` is in `android/app/`
- Check `firebase_options.dart` has correct credentials
- Run `flutter clean` and `flutter pub get`

### "Authentication failed"
- Ensure Email/Password is enabled in Firebase Console
- Check internet connection

### "Cannot write to database"
- Check Realtime Database rules
- Ensure user is authenticated

## Resources

- [FlutterFire Documentation](https://firebase.flutter.dev)
- [Firebase Console](https://console.firebase.google.com)
- [Android Emulator Setup](https://developer.android.com/studio/run/emulator)

---

Once Firebase is configured, the app will be fully functional with:
✅ Email/Password authentication
✅ User profiles and statistics
✅ Ride tracking and recording
✅ Community rides
✅ Training modules
✅ Bike maintenance logs
✅ Exam preparation
