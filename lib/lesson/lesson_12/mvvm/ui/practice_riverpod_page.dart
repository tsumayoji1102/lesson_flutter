import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lesson_flutter/lesson/lesson_12/mvvm/ui/practice_riverpod_view_model.dart';

/// Riverpodを利用する場合、ConsumerWidgetを使用しなければならない
class PracticeRiverpodPage extends ConsumerWidget {
  const PracticeRiverpodPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// ref.watch(provider名)で、状態の監視ができる
    /// 監視ができるというのは、状態が変更された際に自動で再描画されるということ
    final state = ref.watch(practiceRiverpodViewModelProvider);

    /// ref.read(provider名.notifier)で、riverpodのクラスのインスタンスを取得できる
    /// readは監視でないため、状態が変更されても再描画されない。これはよく間違えられるので注意。
    final viewModel = ref.read(practiceRiverpodViewModelProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: const Text('Riverpodの練習')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// 状態をここで判定
            /// viewModel.updateNumber()にて状態更新処理が入っているため、呼び出されたのちに新しいstateが反映される
            Text('ランダムな数値: ${state.randomNumber}'),

            const SizedBox(height: 16),

            /// タップ時にViewModelのメソッドを呼び出す。
            ElevatedButton(
              onPressed: () {
                viewModel.updateNumber();
              },
              child: const Text('ランダムな数値を更新'),
            ),

            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 16),

            /// PracticeRiverpodViewModel2を使用したWidget
            const Expanded(child: PostListWidget()),
          ],
        ),
      ),
    );
  }
}

/// PracticeRiverpodViewModel2を使用して投稿リストを表示するWidget
class PostListWidget extends ConsumerWidget {
  const PostListWidget({super.key});

  /// PracticeRiverpodViewModel2は非同期の状態を持つので、whenやswitchで状態の分岐をしなければならない。
  /// StateProviderという考え方。data（状態が通常通り取得）、loading（ローディング中）、error（エラー発生）の3つの状態を持つ
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// PracticeRiverpodViewModel2の状態を監視
    final asyncPosts = ref.watch(practiceRiverpodViewModel2Provider);
    final viewModel2 = ref.read(practiceRiverpodViewModel2Provider.notifier);

    return Column(
      children: [
        Expanded(
          child: asyncPosts.when(
            /// ローディング中
            loading: () => const Center(child: CircularProgressIndicator()),

            /// エラー時
            error:
                (error, stackTrace) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error, color: Colors.red, size: 48),
                      const SizedBox(height: 16),
                      Text('エラーが発生しました: $error'),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          viewModel2.updatePosts();
                        },
                        child: const Text('再試行'),
                      ),
                    ],
                  ),
                ),

            /// データ取得成功時
            data: (posts) {
              if (posts.isEmpty) {
                return const Center(child: Text('投稿がありません'));
              }
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(post.userId.substring(0, 1).toUpperCase()),
                      ),
                      title: Text(post.content),
                      subtitle: Text(
                        'ユーザーID: ${post.userId}\n作成日時: ${_formatDateTime(post.createdAt)}',
                      ),
                      isThreeLine: true,
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  /// 日時をフォーマットするヘルパーメソッド
  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.year}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.day.toString().padLeft(2, '0')} '
        '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}
