import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ホームページ'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'ようこそ！',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'ログインユーザー: ${FirebaseAuth.instance.currentUser?.email ?? "ゲスト"}',
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              /// ログアウトする。
              /// ログイン状態がクリアされるので、LoginPageに遷移する。
              await FirebaseAuth.instance.signOut();
            },
            child: const Text('ログアウト'),
          ),
        ],
      ),
    );
  }
}
