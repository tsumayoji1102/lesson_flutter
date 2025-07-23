import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lesson_flutter/lesson/lesson_9/create_account_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ログイン')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'メールアドレス',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'メールアドレスを入力してください';
                  }
                  if (!RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  ).hasMatch(value)) {
                    return '正しいメールアドレスを入力してください';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'パスワード',
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'パスワードを入力してください';
                  }
                  if (value.length < 6) {
                    return 'パスワードは6文字以上で入力してください';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _signIn,
                  child:
                      _isLoading
                          ? const CircularProgressIndicator()
                          : const Text('ログイン'),
                ),
              ),
              const SizedBox(height: 16),

              /// アカウント作成画面に画面遷移
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateAccountPage(),
                    ),
                  );
                },
                child: const Text('アカウント作成'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _signIn() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      /// メールアドレスとパスワードを使ってログインする処理。
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      if (mounted) {
        // ログイン成功時の処理
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('ログインしました'),
            backgroundColor: Colors.green,
          ),
        );
        // 必要に応じて画面遷移などを行う
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'user-not-found':
          message = 'このメールアドレスのユーザーは見つかりません';
          break;
        case 'wrong-password':
          message = 'パスワードが間違っています';
          break;
        case 'invalid-email':
          message = 'メールアドレスの形式が正しくありません';
          break;
        case 'user-disabled':
          message = 'このアカウントは無効になっています';
          break;
        case 'too-many-requests':
          message = 'ログイン試行回数が多すぎます。しばらく待ってから再試行してください';
          break;
        case 'invalid-credential':
          message = 'メールアドレスまたはパスワードが間違っています';
          break;
        default:
          message = 'ログインに失敗しました: ${e.message}';
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message), backgroundColor: Colors.red),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('予期しないエラーが発生しました: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
