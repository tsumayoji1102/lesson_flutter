// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'practice_riverpod_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$practiceRiverpodViewModelHash() =>
    r'4cb62a8773021a7a6940f848c6e9ce2005c59228';

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
///
/// Copied from [PracticeRiverpodViewModel].
@ProviderFor(PracticeRiverpodViewModel)
final practiceRiverpodViewModelProvider = AutoDisposeNotifierProvider<
  PracticeRiverpodViewModel,
  PracticeRiverpodPageState
>.internal(
  PracticeRiverpodViewModel.new,
  name: r'practiceRiverpodViewModelProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$practiceRiverpodViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PracticeRiverpodViewModel =
    AutoDisposeNotifier<PracticeRiverpodPageState>;
String _$practiceRiverpodViewModel2Hash() =>
    r'de503d9c531471839b9f0f5cfabbb5d8aa5ed604';

/// buildメソッドの返り値をFutureにすることで、非同期での状態管理が可能になる
///
/// Copied from [PracticeRiverpodViewModel2].
@ProviderFor(PracticeRiverpodViewModel2)
final practiceRiverpodViewModel2Provider = AutoDisposeAsyncNotifierProvider<
  PracticeRiverpodViewModel2,
  List<PostModel>
>.internal(
  PracticeRiverpodViewModel2.new,
  name: r'practiceRiverpodViewModel2Provider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$practiceRiverpodViewModel2Hash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PracticeRiverpodViewModel2 =
    AutoDisposeAsyncNotifier<List<PostModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
