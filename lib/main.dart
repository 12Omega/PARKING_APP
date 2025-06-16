import 'package:flutter/material.dart';
import 'configs/app_theme.dart'; // Only if you created theme file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parking App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme
          .lightTheme, // You can comment this out if not yet implemented
      home: const Scaffold(
        body: Center(child: Text("Parking App Initialized")),
      ),
    );
  }
}
