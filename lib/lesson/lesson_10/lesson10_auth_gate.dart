import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lesson_flutter/lesson/lesson_10/lesson10_home_page.dart';
import 'package:lesson_flutter/lesson/lesson_9/login_page.dart';

/// 認証状態を監視し、ログインしているかどうかで画面を切り替える
class Lesson10AuthGate extends StatelessWidget {
  const Lesson10AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      /// FirebaseAuthの認証状態（ログイン）を監視する
      /// ログインしているのを検知したらHomePage、そうでなければLoginPageを表示する
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          return const Lesson10HomePage();
        }
        return const LoginPage();
      },
    );
  }
}
