// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'practice_riverpod_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$practiceRiverpodRepositoryHash() =>
    r'1e0d60c686ea54d6c2e461538940daca6739375e';

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
///
/// Copied from [PracticeRiverpodRepository].
@ProviderFor(PracticeRiverpodRepository)
final practiceRiverpodRepositoryProvider =
    AutoDisposeNotifierProvider<PracticeRiverpodRepository, void>.internal(
      PracticeRiverpodRepository.new,
      name: r'practiceRiverpodRepositoryProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$practiceRiverpodRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$PracticeRiverpodRepository = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
