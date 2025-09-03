import 'package:lesson_flutter/lesson/lesson_10/post_model.dart';
import 'package:lesson_flutter/lesson/lesson_12/mvvm/ui/practice_riverpod_page_state.dart';
import 'package:lesson_flutter/lesson/lesson_12/mvvm/data/practice_riverpod_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

/// riverpodを利用する場合は生成ファイルが作成されるため、以下のようにpartで紐付けなければならない
///
/// （一旦、理屈というよりは、追加しなければ動かないと思っていただけるとよい）
/// (ファイル名).g.dart という命名で設定しなければならないので注意
part 'practice_riverpod_view_model.g.dart';

/// 1. クラスを作成し、extends _$(クラス名)と設定する
///
/// 2. @riverpodをクラスに対してつける（アノテーションする）
///
/// 3. @overrideでbuildメソッドを実装する
///    - buildメソッドはイニシャライザ。クラスが作成される時に一度だけ実行されるので初期化処理などを行う
///    - 返り値を特定のクラスにすることで、stateとして状態管理させることができる
///
/// 4. ここまでかけたら、ターミナルで flutter pub run build_runner build 実行。
///    生成ファイルが作成され、エラーが消える
///
/// 5. 4が成功したら、(クラス名)Providerという名前でProviderが生成され, 使えるようになる
/// 　　(ここではpracticeRiverpodViewModelProvider. 1文字目が小文字になることに注意).
///.   PracticeRiverpodPageにて使用しているので、確認して欲しい。
///
@riverpod
class PracticeRiverpodViewModel extends _$PracticeRiverpodViewModel {
  /// buildの返り値をPracticeRiverpodPageStateにしているため、
  /// このクラスで管理される状態はPracticeRiverpodPageStateとなる.
  @override
  PracticeRiverpodPageState build() {
    return PracticeRiverpodPageState();
  }

  /// riverpodで設定したクラスの中では、別のriverpodのクラスを呼び出すことができる
  /// ref（WidgetRefというriverpod独自のクラス）を利用して、他のriverpodクラスを呼び出す
  PracticeRiverpodRepository get _repository =>
      ref.read(practiceRiverpodRepositoryProvider.notifier);

  /// 状態を更新するメソッドの例
  void updateNumber() {
    /// 新しい数字を取得
    final newNumber = _repository.randomNumber;

    /// stateを更新
    state = state.copyWith(randomNumber: newNumber);
  }
}

/// buildメソッドの返り値をFutureにすることで、非同期での状態管理が可能になる
@riverpod
class PracticeRiverpodViewModel2 extends _$PracticeRiverpodViewModel2 {
  @override
  Future<List<PostModel>> build() async {
    return await _repository.fetchPosts();
  }

  PracticeRiverpodRepository get _repository =>
      ref.read(practiceRiverpodRepositoryProvider.notifier);

  Future<void> updatePosts() async {
    /// 再取得
    final newPosts = await _repository.fetchPosts();

    /// 現在の状態を取得
    final value = state.valueOrNull;
    if (value == null) return;

    /// 状態を更新。非同期の状態を更新する場合は、AsyncDataの状態を更新する
    state = AsyncData(newPosts);
  }
}
