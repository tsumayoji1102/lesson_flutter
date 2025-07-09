// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_8_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GithubUser _$GithubUserFromJson(Map<String, dynamic> json) => _GithubUser(
  login: json['login'] as String? ?? '',
  avatarUrl: json['avatar_url'] as String,
);

Map<String, dynamic> _$GithubUserToJson(_GithubUser instance) =>
    <String, dynamic>{
      'login': instance.login,
      'avatar_url': instance.avatarUrl,
    };
