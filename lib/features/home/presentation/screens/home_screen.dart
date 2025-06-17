import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        title: const Text("Welcome"),
      ),
      body: const Center(
        child: Text(
          "You are logged in!",
          style: TextStyle(fontSize: 20, color: AppColors.text),
        ),
      ),
    );
  }
}
