import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FirestorePostList extends HookWidget {
  const FirestorePostList({super.key});

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
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream:
                      FirebaseFirestore.instance
                          .collection('posts')
                          .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(child: Text('No posts available.'));
                    }

                    final posts = snapshot.data!.docs;

                    /// 投稿のリストを表示するためにListViewを使用します。
                    /// ListView.separatedを使用して、各投稿の間にスペースを設けます。
                    return ListView.separated(
                      /// separatorBuilderを使用して、各投稿の間にスペースを設けます。
                      separatorBuilder:
                          (context, index) => const SizedBox(height: 8),
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        final post = posts[index];
                        return PostCell(
                          userId: post['userId'],
                          content: post['content'],
                        );
                      },
                    );
                  },
                ),
              ),

              /// [投稿追加画面]
              /// - 投稿を追加するためのテキストフィールド、ボタンを配置します。
              /// - 横並びに配置するためにRowを使用します。
              Row(
                children: [
                  /// テキストフィールドを横いっぱいに広げるためにExpandedを使用します。
                  Expanded(
                    child: TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        labelText: '投稿を入力',
                        border: OutlineInputBorder(),
                      ),
                      onSubmitted: (value) {
                        // タイトルが入力されたときの処理
                      },
                    ),
                  ),
                  const SizedBox(width: 8),

                  /// 投稿ボタン
                  InkWell(
                    onTap: () async {
                      // 投稿を追加する処理をここに実装します。
                      if (titleController.text.isEmpty) return;
                      await addPost(titleController.text);
                    },
                    child: const Icon(Icons.add, size: 30),
                  ),
                ],
              ),
            ],
          ),
        ),

        /// 右下にボタンを設置できます。
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     // ここに新しい投稿を追加する処理を実装できます
        //     // 例えば、ダイアログを表示してユーザーから入力を受け取るなど
        //     ScaffoldMessenger.of(context).showSnackBar(
        //       const SnackBar(
        //         content: Text('Add new post feature not implemented yet'),
        //       ),
        //     );
        //   },
        //   child: const Icon(Icons.add),
        // ),
      ),
    );
  }

  /// Firestoreに投稿を追加するメソッド
  Future<void> addPost(String content) async {
    await FirebaseFirestore.instance.collection('posts').add({
      'userId': FirebaseAuth.instance.currentUser?.uid ?? 'anonymous',
      'content': content,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}

/// 投稿を表示するためのウィジェット。
class PostCell extends StatelessWidget {
  final String userId;
  final String content;

  const PostCell({super.key, required this.userId, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(child: ListTile(title: Text(userId), subtitle: Text(content)));
  }
}
