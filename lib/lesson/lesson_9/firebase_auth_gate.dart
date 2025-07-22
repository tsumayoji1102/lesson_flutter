import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lesson_flutter/lesson/lesson_9/list_page.dart';
import 'package:lesson_flutter/lesson/lesson_9/login_page.dart';

class FirebaseAuthGate extends StatelessWidget {
  const FirebaseAuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    // Firebaseの認証状態を監視するためのStreamBuilderを使用
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // 認証状態の取得中はローディングインジケーターを表示
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          // ユーザーが認証されている場合、メイン画面に遷移
          return const ListPage();
        } else {
          // ユーザーが認証されていない場合、ログイン画面に遷移
          return const LoginPage();
        }
      },
    );
  }
}
