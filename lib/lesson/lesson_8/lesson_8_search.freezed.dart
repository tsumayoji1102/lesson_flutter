// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_8_search.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GithubUser {

 String get login;@JsonKey(name: 'avatar_url') String get avatarUrl;
/// Create a copy of GithubUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GithubUserCopyWith<GithubUser> get copyWith => _$GithubUserCopyWithImpl<GithubUser>(this as GithubUser, _$identity);

  /// Serializes this GithubUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GithubUser&&(identical(other.login, login) || other.login == login)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,login,avatarUrl);

@override
String toString() {
  return 'GithubUser(login: $login, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class $GithubUserCopyWith<$Res>  {
  factory $GithubUserCopyWith(GithubUser value, $Res Function(GithubUser) _then) = _$GithubUserCopyWithImpl;
@useResult
$Res call({
 String login,@JsonKey(name: 'avatar_url') String avatarUrl
});




}
/// @nodoc
class _$GithubUserCopyWithImpl<$Res>
    implements $GithubUserCopyWith<$Res> {
  _$GithubUserCopyWithImpl(this._self, this._then);

  final GithubUser _self;
  final $Res Function(GithubUser) _then;

/// Create a copy of GithubUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? login = null,Object? avatarUrl = null,}) {
  return _then(_self.copyWith(
login: null == login ? _self.login : login // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _GithubUser implements GithubUser {
  const _GithubUser({this.login = '', @JsonKey(name: 'avatar_url') required this.avatarUrl});
  factory _GithubUser.fromJson(Map<String, dynamic> json) => _$GithubUserFromJson(json);

@override@JsonKey() final  String login;
@override@JsonKey(name: 'avatar_url') final  String avatarUrl;

/// Create a copy of GithubUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GithubUserCopyWith<_GithubUser> get copyWith => __$GithubUserCopyWithImpl<_GithubUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GithubUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GithubUser&&(identical(other.login, login) || other.login == login)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,login,avatarUrl);

@override
String toString() {
  return 'GithubUser(login: $login, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class _$GithubUserCopyWith<$Res> implements $GithubUserCopyWith<$Res> {
  factory _$GithubUserCopyWith(_GithubUser value, $Res Function(_GithubUser) _then) = __$GithubUserCopyWithImpl;
@override @useResult
$Res call({
 String login,@JsonKey(name: 'avatar_url') String avatarUrl
});




}
/// @nodoc
class __$GithubUserCopyWithImpl<$Res>
    implements _$GithubUserCopyWith<$Res> {
  __$GithubUserCopyWithImpl(this._self, this._then);

  final _GithubUser _self;
  final $Res Function(_GithubUser) _then;

/// Create a copy of GithubUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? login = null,Object? avatarUrl = null,}) {
  return _then(_GithubUser(
login: null == login ? _self.login : login // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
