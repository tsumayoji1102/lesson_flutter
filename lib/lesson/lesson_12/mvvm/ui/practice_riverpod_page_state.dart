import 'package:freezed_annotation/freezed_annotation.dart';

part 'practice_riverpod_page_state.freezed.dart';

/// freezedでなくともよいが、管理する画面全体の状態をまとめるクラスを用意
@freezed
abstract class PracticeRiverpodPageState with _$PracticeRiverpodPageState {
  const factory PracticeRiverpodPageState({
    @Default(0) int randomNumber,
    @Default('') String message,
  }) = _PracticeRiverpodPageState;
}
