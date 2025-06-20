import 'package:flutter/material.dart';

class ThemeConstant {
  ThemeConstant._();
  static const Color darkPrimaryColor = Colors.yellow; // Accent
  static const Color primaryColor = Colors.green; // Accent
  static const Color appBarColor = Colors.green; // Will be replaced by lightAppBarColor

  // New Theme Colors
  static const Color lightBackgroundColor = Color(0xFFF5F5F5);
  static const Color darkBackgroundColor = Color(0xFF121212);
  static const Color lightButtonColor = Colors.blue;
  static const Color darkButtonColor = Colors.yellow; // Matches current darkPrimaryColor
  static const Color lightTextColor = Colors.black;
  static const Color darkTextColor = Colors.white;
  static const Color lightAppBarColor = Colors.blue;
  static const Color darkAppBarColor = Colors.yellow; // Matches current darkPrimaryColor
}
