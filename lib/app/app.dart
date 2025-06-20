import 'package:flutter/material.dart';
import 'theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parking App',
      theme: AppTheme.lightTheme,
      home: const Placeholder(),
    );
  }
}
