import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MotoRadarColors {
  static const Color orange = Color(0xFFFF6B35);
  static const Color orangeDark = Color(0xFFE55100);
  static const Color red = Color(0xFFD32F2F);
  static const Color dark = Color(0xFF1A1A1A);
  static const Color darkLighter = Color(0xFF2D2D2D);
  static const Color charcoal = Color(0xFF3A3A3A);
  static const Color accent = Color(0xFFFFA500);
  static const Color white = Color(0xFFFFFFFF);
  static const Color gray400 = Color(0xFF9CA3AF);
  static const Color gray500 = Color(0xFF6B7280);
}

class MotoRadarTheme {
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: MotoRadarColors.orange,
      scaffoldBackgroundColor: MotoRadarColors.dark,
      appBarTheme: AppBarTheme(
        backgroundColor: MotoRadarColors.dark,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: MotoRadarColors.white,
        ),
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.poppins(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: MotoRadarColors.white,
        ),
        headlineSmall: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: MotoRadarColors.white,
        ),
        bodyMedium: GoogleFonts.poppins(
          fontSize: 14,
          color: MotoRadarColors.white,
        ),
        bodySmall: GoogleFonts.poppins(
          fontSize: 12,
          color: MotoRadarColors.gray400,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: MotoRadarColors.dark,
        selectedItemColor: MotoRadarColors.orange,
        unselectedItemColor: MotoRadarColors.gray500,
        type: BottomNavigationBarType.fixed,
        elevation: 16,
      ),
    );
  }
}
