import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  Future<void> login() async {
    final email = emailController.text;
    final password = passwordController.text;

    // バリデーション
    if (email.isEmpty || !email.contains('@')) {
      _showError('正しいメールアドレスを入力してください');
      return;
    }
    if (password.length < 6) {
      _showError('パスワードは6文字以上で入力してください');
      return;
    }

    setState(() => isLoading = true);

    // API通信
    try {
      await Future.delayed(Duration(seconds: 2)); // 擬似API呼び出し
      if (email == 'test@example.com' && password == 'password123') {
        // ローカルストレージに保存
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_email', email);
        await prefs.setBool('is_logged_in', true);

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
