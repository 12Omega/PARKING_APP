class AuthService {
  static Future<bool> login(String email, String password) async {
    // Dummy authentication logic
    await Future.delayed(Duration(seconds: 1));
    return email == 'test@example.com' && password == 'password';
  }
}
