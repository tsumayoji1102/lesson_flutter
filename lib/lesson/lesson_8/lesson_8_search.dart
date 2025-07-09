import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;

part 'lesson_8_search.freezed.dart';
part 'lesson_8_search.g.dart';

class Lesson8Search extends HookWidget {
  const Lesson8Search({super.key});

  @override
  Widget build(BuildContext context) {
    final userList = useState<List<GithubUser>>([]);
    return Scaffold(
      appBar: AppBar(title: const Text('Lesson 8 Search')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: '検索キーワード',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) async {
                // 検索処理をここに追加
                // 例えば、APIを呼び出して結果を表示するなど
                print('検索キーワード: $value');
                if (value.isEmpty) return;
                userList.value = await fetchData(value);
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: userList.value.length,
                itemBuilder: (context, index) {
                  final user = userList.value[index];
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: ListTile(
                      leading: Image.network(user.avatarUrl),
                      title: Text(user.login),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<GithubUser>> fetchData(String searchValue) async {
    try {
      // ここにデータを取得する処理を追加
      // 今回はダミーのデータを返す
      final result = await http.get(
        Uri.parse("https://api.github.com/search/users?q=$searchValue"),
      );

      /// httpで結果を取得した場合、jsonDecodeを使ってデコードします。
      /// これをしないと、取得結果がただの文字列として扱われてしまい、使うことができません。
      final json = jsonDecode(result.body);
      final users =
          (json['items'] as List<dynamic>).map((item) {
            return GithubUser.fromJson(item as Map<String, dynamic>);
          }).toList();
      return users;
    } catch (e) {
      // エラー処理を追加
      print('Error fetching data: $e');
      return [];
    }
  }
}

// 通常のクラスでモデルクラスを作成する場合はこちら
// class GithubUser {
//   final String login;
//   final String avatarUrl;

//   GithubUser({required this.login, required this.avatarUrl});

//   factory GithubUser.fromJson(Map<String, dynamic> json) {
//     return GithubUser(
//       login: json['login'] as String,
//       avatarUrl: json['avatar_url'] as String,
//     );
//   }
// }

/// 今回はサンプルとしてfreezedを使用しています。
@freezed
abstract class GithubUser with _$GithubUser {
  const factory GithubUser({
    @Default('') String login,
    @JsonKey(name: 'avatar_url') required String avatarUrl,
  }) = _GithubUser;

  /// fromJsonを定義し、以下コマンドを実行
  /// dart run build_runner build --delete-conflicting-outputs
  factory GithubUser.fromJson(Map<String, dynamic> json) =>
      _$GithubUserFromJson(json);
}
