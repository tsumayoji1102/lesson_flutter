import 'package:flutter/material.dart';

/// 投稿の内容を入力するためのウィジェット。
/// テキストフィールドと投稿ボタンを含みます。
class PostContentArea extends StatelessWidget {
  const PostContentArea({
    super.key,
    required this.titleController,
    required this.onPostSubmitted,
  });

  final TextEditingController titleController;

  /// 投稿ボタンが押されたときの処理。ボタンに使っている。
  final VoidCallback onPostSubmitted;

  @override
  Widget build(BuildContext context) {
    return Row(
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
          onTap: () {
            // 投稿を追加する処理をここに実装します。
            if (titleController.text.isEmpty) return;
            onPostSubmitted();
          },
          child: const Icon(Icons.add, size: 30),
        ),
      ],
    );
  }
}
