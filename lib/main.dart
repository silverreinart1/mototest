import 'package:flutter/material.dart';
import 'package:motoradar/screens/home_screen.dart';
import 'package:motoradar/screens/placeholder_screen.dart';
import 'package:motoradar/theme/theme.dart';

void main() {
  runApp(const MotoRadarApp());
}

class MotoRadarApp extends StatelessWidget {
  const MotoRadarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MotoRadar',
      theme: MotoRadarTheme.theme,
      home: const HomeScreen(),
      routes: {
        '/participate': (context) => const PlaceholderScreen(title: 'Participate'),
        '/map': (context) => const PlaceholderScreen(title: 'Map'),
        '/profile': (context) => const PlaceholderScreen(title: 'Profile'),
        '/help': (context) => const PlaceholderScreen(title: 'Help'),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
