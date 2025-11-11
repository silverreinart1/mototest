import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:motoradar/screens/home_screen.dart';
import 'package:motoradar/screens/login_screen.dart';
import 'package:motoradar/screens/participate_screen.dart';
import 'package:motoradar/screens/map_screen.dart';
import 'package:motoradar/screens/profile_screen.dart';
import 'package:motoradar/screens/exam_prep_screen.dart';
import 'package:motoradar/theme/theme.dart';
import 'package:motoradar/providers/user_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MotoRadarApp());
}

class MotoRadarApp extends StatelessWidget {
  const MotoRadarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        title: 'MotoRadar',
        theme: MotoRadarTheme.theme,
        home: Consumer<UserProvider>(
          builder: (context, userProvider, child) {
            return userProvider.isAuthenticated
                ? const HomeScreen()
                : const LoginScreen();
          },
        ),
        routes: {
          '/': (context) => const HomeScreen(),
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
