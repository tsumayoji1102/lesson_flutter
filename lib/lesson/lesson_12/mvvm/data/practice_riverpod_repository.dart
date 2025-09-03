import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lesson_flutter/lesson/lesson_10/post_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

///
part 'practice_riverpod_repository.g.dart';

/// 状態を持たないriverpodのクラスを作成する例.
///
/// 1. クラスを作成し、extends _$(クラス名)と設定する
///
/// 2. @riverpodをクラスに対してつける（アノテーションする）
///
/// 3. @overrideでbuildメソッドを実装する
///    - 返り値をvoidにすることで、状態を持たないクラスにできる
///
/// 4. ここまでかけたら、ターミナルで flutter pub run build_runner build 実行。
///    生成ファイルが作成され、エラーが消える
///
/// 5. 4が成功したら、(クラス名)Providerという名前でProviderが生成され, 使えるようになる
/// 　　(ここではpracticeRiverpodRepositoryProvider. 1文字目が小文字になることに注意).
///.   PracticeRiverpodViewModelにて使用しているので、確認して欲しい。
///
@riverpod
class PracticeRiverpodRepository extends _$PracticeRiverpodRepository {
  /// 何も返り値を設定していないので、状態は持っていないクラスとなる。
  @override
  void build() {}

  /// 実験台として、ランダムな数値を返すメソッドを用意
  int get randomNumber {
    return Random().nextInt(100);
  }

  /// Firestoreから投稿データを取得するメソッド.
  Future<List<PostModel>> fetchPosts() async {
    final snapshot = await FirebaseFirestore.instance.collection('posts').get();
    return snapshot.docs.map((doc) => PostModel.fromJson(doc.data())).toList();
  }
}
