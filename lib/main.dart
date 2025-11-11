import 'package:flutter/material.dart';
import 'package:motoradar/screens/home_screen.dart';
import 'package:motoradar/screens/participate_screen.dart';
import 'package:motoradar/screens/map_screen.dart';
import 'package:motoradar/screens/profile_screen.dart';
import 'package:motoradar/screens/exam_prep_screen.dart';
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
        '/': (context) => const HomeScreen(),
        '/participate': (context) => const ParticipateScreen(),
        '/map': (context) => const MapScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/help': (context) => const ExamPrepScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
