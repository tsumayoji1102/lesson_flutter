import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// バリデーション責任
class LoginValidator {
  static String? validateEmail(String email) {
    if (email.isEmpty || !email.contains('@')) {
      return '正しいメールアドレスを入力してください';
    }
    return null;
  }

  static String? validatePassword(String password) {
    if (password.length < 6) {
      return 'パスワードは6文字以上で入力してください';
    }
    return null;
  }
}

// データ保存責任
class UserStorage {
  static Future<void> saveLoginData(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_email', email);
    await prefs.setBool('is_logged_in', true);
  }
}

// API通信責任
class LoginService {
  static Future<bool> authenticate(String email, String password) async {
    await Future.delayed(Duration(seconds: 2)); // 擬似API呼び出し
    return email == 'test@example.com' && password == 'password123';
  }
}

// UI表示責任のみ
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  Future<void> login() async {
    final email = emailController.text;
    final password = passwordController.text;

    final emailError = LoginValidator.validateEmail(email);
    if (emailError != null) {
      _showError(emailError);
      return;
    }

    final passwordError = LoginValidator.validatePassword(password);
    if (passwordError != null) {
      _showError(passwordError);
      return;
    }

    setState(() => isLoading = true);

    try {
      final isSuccess = await LoginService.authenticate(email, password);
      if (isSuccess) {
        await UserStorage.saveLoginData(email);
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        _showError('ログインに失敗しました');
      }
    } catch (e) {
      _showError('通信エラーが発生しました');
    }

    setState(() => isLoading = false);
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ログイン')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'メール'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'パスワード'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isLoading ? null : login,
              child: isLoading ? CircularProgressIndicator() : Text('ログイン'),
            ),
          ],
        ),
      ),
    );
  }
}
