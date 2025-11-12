import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, TargetPlatform, kIsWeb;
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:motoradar/screens/home_screen.dart';
import 'package:motoradar/screens/participate_screen.dart';
import 'package:motoradar/screens/map_screen.dart';
import 'package:motoradar/screens/profile_screen.dart';
import 'package:motoradar/screens/exam_prep_screen.dart';
import 'package:motoradar/theme/theme.dart';
import 'package:motoradar/providers/user_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool firebaseEnabled = true;
  // Skip Firebase initialization on unsupported platforms
  if (kIsWeb || defaultTargetPlatform == TargetPlatform.linux) {
    firebaseEnabled = false;
  } else {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    } catch (e) {
      firebaseEnabled = false;
      debugPrint('Firebase initialization failed: $e');
    }
  }
  runApp(MotoRadarApp(firebaseEnabled: firebaseEnabled));
}

class MotoRadarApp extends StatelessWidget {
  final bool firebaseEnabled;
  const MotoRadarApp({Key? key, required this.firebaseEnabled}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider(firebaseEnabled: firebaseEnabled)),
      ],
      child: MaterialApp(
        title: 'MotoRadar',
        theme: MotoRadarTheme.theme,
        home: const HomeScreen(),
        routes: {
          '/participate': (context) => const ParticipateScreen(),
          '/map': (context) => const MapScreen(),
          '/profile': (context) => const ProfileScreen(),
          '/help': (context) => const ExamPrepScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
