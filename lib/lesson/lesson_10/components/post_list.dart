import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lesson_flutter/lesson/lesson_10/components/post_cell.dart';
import 'package:lesson_flutter/lesson/lesson_10/post_model.dart';

/// 投稿一覧を表示するためのウィジェット。
/// Firestoreからデータを取得し、ListViewで表示します。
class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('posts').snapshots(),
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
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemCount: posts.length,
          itemBuilder: (context, index) {
            /// Firestoreから取得したデータをPostModelに変換します。
            final postData = posts[index].data() as Map<String, dynamic>;
            final post = PostModel.fromJson(postData);

            // PostModelを使用して、各投稿を表示するためのPostCellウィジェットを返します。
            return PostCell(post);
          },
        );
      },
    );
  }
}
