import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

/// 投稿のモデルクラス。
class PostModel {
  final String userId;
  final String content;
  final DateTime createdAt;

  PostModel({
    required this.userId,
    required this.content,
    required this.createdAt,
  });

  /// Firestoreから取得したデータをPostModelに変換するためのファクトリメソッド。
  factory PostModel.fromJson(Map<String, dynamic> data) {
    return PostModel(
      userId: data['userId'] ?? 'anonymous',
      content: data['content'] ?? '',
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {'userId': userId, 'content': content, 'createdAt': createdAt};
  }
}

/// freezedを使用した例はこちら。
@freezed
abstract class FreezedPostModel with _$FreezedPostModel {
  const factory FreezedPostModel({
    required String userId,
    required String content,

    /// TimestampをDateTimeに変換するためのJsonKeyを使用します。
    @JsonKey(fromJson: _fromTimestamp, toJson: _toTimestamp)
    required DateTime createdAt,
  }) = _FreezedPostModel;

  /// fromJson, toJsonが自動で実装される。
  factory FreezedPostModel.fromJson(Map<String, dynamic> json) =>
      _$FreezedPostModelFromJson(json);
}

/// FirestoreのTimestampとDateTimeの変換を行うヘルパーメソッド。
DateTime _fromTimestamp(Timestamp? timestamp) {
  if (timestamp == null) return DateTime.now();
  return timestamp.toDate();
}

Timestamp _toTimestamp(DateTime dateTime) {
  return Timestamp.fromDate(dateTime);
}
