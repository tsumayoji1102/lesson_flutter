// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FreezedPostModel _$FreezedPostModelFromJson(Map<String, dynamic> json) =>
    _FreezedPostModel(
      userId: json['userId'] as String,
      content: json['content'] as String,
      createdAt: _fromTimestamp(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$FreezedPostModelToJson(_FreezedPostModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'content': instance.content,
      'createdAt': _toTimestamp(instance.createdAt),
    };
