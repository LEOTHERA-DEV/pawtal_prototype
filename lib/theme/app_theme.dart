import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryRed = Color(0xFFE33535);
  static const Color primaryBlue = Color(0xFF3B5BA5);
  static const Color secondaryYellow = Color(0xFFFFCB05);
  static const Color darkBlue = Color(0xFF1A2C4E);
  static const Color lightGray = Color(0xFFF5F5F5);
  static const Color successGreen = Color(0xFF4CAF50);
  static const Color warningOrange = Color(0xFFFF9800);
  static const Color electricYellow = Color(0xFFFFD966);
  static const Color waterBlue = Color(0xFF64B5F6);
  static const Color fireRed = Color(0xFFEF5350);

  static ThemeData getTheme() {
    return ThemeData(
      primaryColor: primaryRed,
      scaffoldBackgroundColor: lightGray,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
        backgroundColor: primaryRed,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryRed,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      cardTheme: CardThemeData(
        // Changed from CardTheme to CardThemeData
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  static BoxDecoration pokeballBackground() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white,
          lightGray,
        ],
      ),
    );
  }

  static BoxDecoration typeCardDecoration(String type) {
    Color color;
    switch (type.toLowerCase()) {
      case 'electric':
        color = electricYellow;
        break;
      case 'water':
        color = waterBlue;
        break;
      case 'fire':
        color = fireRed;
        break;
      default:
        color = primaryBlue;
    }

    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [color, color.withOpacity(0.7)],
      ),
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: color.withOpacity(0.3),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }
}
