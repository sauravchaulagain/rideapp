import 'package:flutter/material.dart';

class PoppinsTextStyles {
  // Color constants
  static const Color primaryColor = Color(0xFFFB8A00); // Orange600
  static const Color accentColor = Color(0xFFFB8A00); // Orange600
  static const Color blue500 = Color(0xFF2196F3); // Blue500
  static const Color red500 = Color(0xFFF44336); // Red500
  static const Color green600 = Color(0xFF4CAF50); // Green600
  static const Color yellow600 = Color(0xFFFFEB3B); // Yellow600
  static const Color gray300 = Color(0xFFE0E0E0); // Gray300
  static const Color gray700 = Color(0xFF616161); // Gray700
  static const Color gray800 = Color(0xFF424242); // Gray800
  static const Color gray900 = Color(0xFF212121); // Gray900
  static const Color white = Colors.white; // White

  // Typography
  static const String fontFamily = 'Poppins';

  // Title xlarge
  static TextStyle titleXLargeRegular = TextStyle(
    fontSize: 34,
    height: 41 / 34,
    letterSpacing: 0,
    fontFamily: fontFamily,
    color: primaryColor,
    fontWeight: FontWeight.w400,
  );

  // Title large
  static TextStyle titleLargeRegular = TextStyle(
    fontSize: 28,
    height: 34 / 28,
    letterSpacing: 0,
    fontFamily: fontFamily,
    color: Colors.yellow, // Placeholder, replace with desired color
    fontWeight: FontWeight.w400,
  );

  //used already
  static TextStyle titleMediumRegular = TextStyle(
    fontSize: 24,
    height: 30 / 24,
    letterSpacing: 0,
    fontFamily: fontFamily,
    color: Colors.black,
    fontWeight: FontWeight.w400,
  );

  // Title small
  static TextStyle titleSmallRegular = TextStyle(
    fontSize: 22,
    height: 30 / 22,
    letterSpacing: 0,
    fontFamily: fontFamily,
    color: Colors.orange, // Placeholder, replace with desired color
    fontWeight: FontWeight.w400,
  );

  // Headline large
  static TextStyle headlineLargeRegular = TextStyle(
    fontSize: 20,
    height: 26 / 20,
    letterSpacing: 0,
    fontFamily: fontFamily,
    color: Colors.red, // Placeholder, replace with desired color
    fontWeight: FontWeight.w400,
  );

  // Headline small
  static TextStyle headlineSmallRegular = TextStyle(
    fontSize: 18,
    height: 24 / 18,
    letterSpacing: 0,
    fontFamily: fontFamily,
    color: Colors.black, // Placeholder, replace with desired color
    fontWeight: FontWeight.w400,
  );

  // Subhead large
  static TextStyle subheadLargeRegular = TextStyle(
    fontSize: 16,
    height: 20 / 16,
    letterSpacing: 0,
    fontFamily: fontFamily,
    color: Colors.green, // Placeholder, replace with desired color
    fontWeight: FontWeight.w400,
  );

  //used already
  static TextStyle subheadSmallRegular = TextStyle(
    fontSize: 14,
    height: 18 / 14,
    letterSpacing: 0,
    fontFamily: fontFamily,
    color: Color(0xFFA0A0A0),
    fontWeight: FontWeight.w400,
  );

  // Body large
  static TextStyle bodyLargeRegular = TextStyle(
    fontSize: 16,
    height: 24 / 16,
    letterSpacing: 0,
    fontFamily: fontFamily,
    color: gray700,
    fontWeight: FontWeight.w400,
  );

  // Body medium
  static TextStyle bodyMediumRegular = TextStyle(
    fontSize: 14,
    height: 22 / 14,
    letterSpacing: 0,
    fontFamily: fontFamily,
    color: gray800,
    fontWeight: FontWeight.w400,
  );

  // Body small
  static TextStyle bodySmallRegular = TextStyle(
    fontSize: 12,
    height: 18 / 12,
    letterSpacing: 0,
    fontFamily: fontFamily,
    color: gray900,
    fontWeight: FontWeight.w400,
  );

  // Label large
  static TextStyle labelLargeRegular = TextStyle(
    fontSize: 16,
    height: 24 / 16,
    letterSpacing: 0,
    fontFamily: fontFamily,
    color: primaryColor,
    fontWeight: FontWeight.w400,
  );

  // Label medium
  static TextStyle labelMediumRegular = TextStyle(
    fontSize: 14,
    height: 18 / 14,
    letterSpacing: 0,
    fontFamily: fontFamily,
    color: primaryColor,
    fontWeight: FontWeight.w400,
  );

  // Label small
  static TextStyle labelSmallRegular = TextStyle(
    fontSize: 12,
    height: 16 / 12,
    letterSpacing: 0,
    fontFamily: fontFamily,
    color: primaryColor,
    fontWeight: FontWeight.w400,
  );

  // Caption
  static TextStyle captionRegular = TextStyle(
    fontSize: 12,
    height: 16 / 12,
    letterSpacing: 0,
    fontFamily: fontFamily,
    color: gray700,
    fontWeight: FontWeight.w400,
  );
}
