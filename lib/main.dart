import 'package:flutter/material.dart';
import 'themes/app_theme.dart';
// import 'utils/font_constants.dart'; // Removed
import 'screens/dashboard_screen.dart';
import 'routes.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
// HomeScreen, BookingsScreen, ProfileScreen imports removed

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
      theme: AppTheme
          .lightTheme, // Removed .copyWith(textTheme: FontConstants.textTheme)
      darkTheme: AppTheme
          .darkTheme, // Removed .copyWith(textTheme: FontConstants.textTheme)
      initialRoute: Routes.home, // DashboardScreen is the initial screen
      routes: {
        Routes.home: (context) =>
            const DashboardScreen(), // Main screen with bottom nav
        Routes.login: (context) => const LoginScreen(),
        Routes.register: (context) => const RegisterScreen(),
        // Routes.homeContent, Routes.bookings, Routes.profile are removed
      },
    );
  }
}
