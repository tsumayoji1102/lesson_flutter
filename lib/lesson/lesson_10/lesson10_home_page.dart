import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lesson_flutter/lesson/lesson_10/components/post_content_area.dart';
import 'package:lesson_flutter/lesson/lesson_10/components/post_list.dart';

class Lesson10HomePage extends HookWidget {
  const Lesson10HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    /// TextEditingControllerを使用して、テキストフィールドの入力を管理します。
    final titleController = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Firestore Post List',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,

        /// 右上にログアウトボタンを設置します。
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app, color: Colors.white),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              if (!context.mounted) return;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('ログアウトしました')));
            },
          ),
        ],
      ),

      /// SafeAreaを使用して、画面の上部に余白を確保します。
      // これにより、ステータスバーやノッチなどのUI要素からコンテンツが隠れないようにします。
      body: SafeArea(
        /// Paddingを設定し、コンテンツが画面の端にくっつかないようにします。
        child: Padding(
          padding: const EdgeInsets.all(20),

          /// 投稿一覧、投稿追加が順に並ぶようにするために、Columnを使用します。
          child: Column(
            children: [
              /// [投稿一覧画面]
              /// - 投稿一覧が画面いっぱいになるようにExpandedを使用します。
              Expanded(child: PostList()),

              /// [投稿追加画面]
              /// - 投稿を追加するためのテキストフィールド、ボタンを配置します。
              /// - 横並びに配置するためにRowを使用します。
              PostContentArea(
                titleController: titleController,
                onPostSubmitted: () async {
                  await addPost(titleController.text);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Firestoreに投稿を追加するメソッド
  Future<void> addPost(String content) async {
    /// コレクション名は 'posts' として、投稿を追加します。
    await FirebaseFirestore.instance.collection('posts').add({
      // ログインしているユーザーのIDを取得して、投稿に紐づけます。
      'userId': FirebaseAuth.instance.currentUser?.uid ?? 'anonymous',
      // 投稿内容
      'content': content,
      // 作成日
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> setPost(String path, String content) async {
    /// コレクション名は 'posts' として、投稿を追加します。
    /// .doc(path)を使用して、特定のドキュメントにデータを設定します。
    await FirebaseFirestore.instance.collection('posts').doc(path).set({
      // ログインしているユーザーのIDを取得して、投稿に紐づけます。
      'userId': FirebaseAuth.instance.currentUser?.uid ?? 'anonymous',
      // 投稿内容
      'content': content,
      // 作成日
      'createdAt': FieldValue.serverTimestamp(),

      // 既存のドキュメントに追加するオプションを指定します。
      // ここでは、マージオプションを使用して、既存のデータを保持しつつ新しいデータを追加します。
    }, SetOptions(merge: true));
  }
}
