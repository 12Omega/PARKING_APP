import 'package:flutter/material.dart';
import 'theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parking App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // Can be .light or .dark as default
      debugShowCheckedModeBanner: false,
      home: const Scaffold(body: Center(child: Text('Welcome to Parking App'))),
    );
  }
}
