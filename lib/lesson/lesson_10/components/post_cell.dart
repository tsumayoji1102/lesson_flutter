import 'package:flutter/material.dart';
import 'package:lesson_flutter/lesson/lesson_10/post_model.dart';

/// 投稿を表示するためのウィジェット。
class PostCell extends StatelessWidget {
  final PostModel post;

  const PostCell(this.post, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(title: Text(post.userId), subtitle: Text(post.content)),
    );
  }
}
