import 'package:flutter/material.dart';
import 'themes/app_theme.dart';
import 'utils/font_constants.dart';
import 'screens/dashboard_screen.dart';

void main() {
  runApp(const ParkingApp());
}

class ParkingApp extends StatelessWidget {
  const ParkingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parking App',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme.copyWith(textTheme: FontConstants.textTheme),
      darkTheme: AppTheme.darkTheme.copyWith(
        textTheme: FontConstants.textTheme,
      ),
      home: const DashboardScreen(),
    );
  }
}
