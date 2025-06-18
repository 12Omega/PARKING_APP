import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final Color _lightBlue = Colors.blue[300]!; // A light blue
  static final Color _darkBlue = Colors.blue[700]!; // A darker blue for accents if needed

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: _lightBlue, // Primary color
    colorScheme: ColorScheme.fromSeed(
      seedColor: _lightBlue,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: Colors.white,
    textTheme: GoogleFonts.robotoTextTheme(ThemeData.light().textTheme),
    appBarTheme: AppBarTheme(
      backgroundColor: _lightBlue,
      foregroundColor: Colors.white, // For title text and icons
      elevation: 0.5,
      titleTextStyle: GoogleFonts.roboto(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _lightBlue,
        foregroundColor: Colors.white,
        textStyle: GoogleFonts.roboto(fontWeight: FontWeight.w500),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: _darkBlue, // Use a darker blue for text buttons for contrast
        textStyle: GoogleFonts.roboto(fontWeight: FontWeight.w500),
      ),
    ),
    useMaterial3: true,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: _lightBlue, // Can use the same light blue, or a different shade
    colorScheme: ColorScheme.fromSeed(
      seedColor: _lightBlue, // Using the same seed color for consistency
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: const Color(0xFF121212), // Common dark theme background
    textTheme: GoogleFonts.robotoTextTheme(ThemeData.dark().textTheme),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[900], // Darker app bar for dark theme
      foregroundColor: Colors.white,   // For title text and icons
      elevation: 0.5,
      titleTextStyle: GoogleFonts.roboto(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _lightBlue, // Light blue can work on dark for primary actions
        foregroundColor: Colors.black, // Text on light blue button
        textStyle: GoogleFonts.roboto(fontWeight: FontWeight.w500),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: _lightBlue, // Light blue for text buttons on dark background
        textStyle: GoogleFonts.roboto(fontWeight: FontWeight.w500),
      ),
    ),
    useMaterial3: true,
  );
}
