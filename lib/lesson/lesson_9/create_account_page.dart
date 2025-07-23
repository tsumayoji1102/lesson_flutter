import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('アカウント作成'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'メールアドレス',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                  helperText: 'アカウント確認用のメールが送信されます',
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
                  helperText: '6文字以上で入力してください',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'パスワードを入力してください';
                  }
                  if (value.length < 6) {
                    return 'パスワードは6文字以上で入力してください';
                  }
                  if (!RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)').hasMatch(value)) {
                    return 'パスワードには英数字を含めてください';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: _obscureConfirmPassword,
                decoration: InputDecoration(
                  labelText: 'パスワード（確認）',
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                  ),
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'パスワード（確認）を入力してください';
                  }
                  if (value != _passwordController.text) {
                    return 'パスワードが一致しません';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _createAccount,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  ),
                  child:
                      _isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                            'アカウントを作成',
                            style: TextStyle(fontSize: 16),
                          ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _createAccount() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      /// FirebaseAuthを使ってアカウントを作成する(credentialを作成、取得)
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text,
          );

      // アカウント作成成功時にメール確認を送信
      if (credential.user != null && !credential.user!.emailVerified) {
        await credential.user!.sendEmailVerification();
      }

      if (mounted) {
        // アカウント作成成功時の処理
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('アカウントを作成しました。確認メールを送信しました。'),
            backgroundColor: Colors.green,
          ),
        );

        // ログイン画面に戻る
        Navigator.pop(context);
      }

      /// 何かしらFirebaseAuthのエラーが返ってくる時は、ハンドリングする
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'weak-password':
          message = 'パスワードが弱すぎます。より強力なパスワードを設定してください。';
          break;
        case 'email-already-in-use':
          message = 'このメールアドレスは既に使用されています。';
          break;
        case 'invalid-email':
          message = 'メールアドレスの形式が正しくありません。';
          break;
        case 'operation-not-allowed':
          message = 'メール/パスワード認証が無効になっています。';
          break;
        case 'too-many-requests':
          message = 'リクエストが多すぎます。しばらく待ってから再試行してください。';
          break;
        default:
          message = 'アカウントの作成に失敗しました: ${e.message}';
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
