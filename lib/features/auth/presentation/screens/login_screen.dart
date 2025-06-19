import 'package:flutter/material.dart';
import '../widgets/form_container.dart';
import '../widgets/app_text_field.dart';
import '../widgets/primary_button.dart';
import '../../data/datasources/auth_service.dart';
import '../../../../routes/app_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  bool _isLoading = false;

  void _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      final error = await AuthService.login(
        _emailCtrl.text,
        _passwordCtrl.text,
      );
      if (!mounted) return;
      setState(() => _isLoading = false);

      if (error != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(error)));
      } else {
        Navigator.pushReplacementNamed(context, Routes.home);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      // title: 'Welcome Back', // Removed title
      child: Form(
        // Changed children to child, and passed Column directly
        key: _formKey,
        child: Column(
          children: [
            AppTextField(
              hintText: 'Email',
              controller: _emailCtrl,
              validator: (val) =>
                  val!.contains('@') ? null : 'Enter a valid email',
            ),
            const SizedBox(height: 20),
            AppTextField(
              hintText: 'Password',
              obscureText: true,
              controller: _passwordCtrl,
              validator: (val) => val!.length >= 6 ? null : 'Min 6 characters',
            ),
            const SizedBox(height: 30),
            _isLoading
                ? const CircularProgressIndicator()
                : PrimaryButton(text: 'Login', onPressed: _handleLogin),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () => Navigator.pushNamed(
                context,
                Routes.register,
              ), // Changed Routes.signup to Routes.register
              child: const Text(
                "Don't have an account? Sign up",
                style: TextStyle(color: Color(0xFF1976D2)),
              ),
            ),
          ],
        ),
      ),
      // ], // Removed extra bracket if children was a list
    );
  }
}
