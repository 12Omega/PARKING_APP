import 'package:flutter/material.dart';
import '../constant/theme_constant.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: ThemeConstant.primaryColor,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: ThemeConstant.lightBackgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: ThemeConstant.lightAppBarColor,
        foregroundColor: ThemeConstant.darkTextColor, // Assuming dark text on light app bar
        elevation: 2,
      ),
      textTheme: TextTheme(
        headlineLarge: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: ThemeConstant.lightTextColor),
        titleLarge: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: ThemeConstant.lightTextColor),
        bodyMedium: const TextStyle(fontSize: 16, color: ThemeConstant.lightTextColor),
        bodySmall: TextStyle(fontSize: 12, color: Colors.grey[600]),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ThemeConstant.lightButtonColor,
          foregroundColor: ThemeConstant.darkTextColor, // Assuming dark text on light button
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ThemeConstant.primaryColor),
        ),
        labelStyle: TextStyle(color: ThemeConstant.primaryColor),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: ThemeConstant.darkPrimaryColor,
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: ThemeConstant.darkBackgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: ThemeConstant.darkAppBarColor,
        foregroundColor: ThemeConstant.lightTextColor, // Assuming light text on dark app bar
        elevation: 2,
      ),
      textTheme: TextTheme(
        headlineLarge: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: ThemeConstant.darkTextColor),
        titleLarge: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: ThemeConstant.darkTextColor),
        bodyMedium: const TextStyle(fontSize: 16, color: ThemeConstant.darkTextColor),
        bodySmall: TextStyle(fontSize: 12, color: Colors.grey[400]),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ThemeConstant.darkButtonColor,
          foregroundColor: ThemeConstant.lightTextColor, // Assuming light text on dark button
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ThemeConstant.darkPrimaryColor),
        ),
        labelStyle: TextStyle(color: ThemeConstant.darkPrimaryColor),
      ),
    );
  }
}
