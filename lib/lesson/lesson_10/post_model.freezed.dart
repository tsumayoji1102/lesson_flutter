// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FreezedPostModel {

 String get userId; String get content;/// TimestampをDateTimeに変換するためのJsonKeyを使用します。
@JsonKey(fromJson: _fromTimestamp, toJson: _toTimestamp) DateTime get createdAt;
/// Create a copy of FreezedPostModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FreezedPostModelCopyWith<FreezedPostModel> get copyWith => _$FreezedPostModelCopyWithImpl<FreezedPostModel>(this as FreezedPostModel, _$identity);

  /// Serializes this FreezedPostModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreezedPostModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,content,createdAt);

@override
String toString() {
  return 'FreezedPostModel(userId: $userId, content: $content, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $FreezedPostModelCopyWith<$Res>  {
  factory $FreezedPostModelCopyWith(FreezedPostModel value, $Res Function(FreezedPostModel) _then) = _$FreezedPostModelCopyWithImpl;
@useResult
$Res call({
 String userId, String content,@JsonKey(fromJson: _fromTimestamp, toJson: _toTimestamp) DateTime createdAt
});




}
/// @nodoc
class _$FreezedPostModelCopyWithImpl<$Res>
    implements $FreezedPostModelCopyWith<$Res> {
  _$FreezedPostModelCopyWithImpl(this._self, this._then);

  final FreezedPostModel _self;
  final $Res Function(FreezedPostModel) _then;

/// Create a copy of FreezedPostModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? content = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _FreezedPostModel implements FreezedPostModel {
  const _FreezedPostModel({required this.userId, required this.content, @JsonKey(fromJson: _fromTimestamp, toJson: _toTimestamp) required this.createdAt});
  factory _FreezedPostModel.fromJson(Map<String, dynamic> json) => _$FreezedPostModelFromJson(json);

@override final  String userId;
@override final  String content;
/// TimestampをDateTimeに変換するためのJsonKeyを使用します。
@override@JsonKey(fromJson: _fromTimestamp, toJson: _toTimestamp) final  DateTime createdAt;

/// Create a copy of FreezedPostModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FreezedPostModelCopyWith<_FreezedPostModel> get copyWith => __$FreezedPostModelCopyWithImpl<_FreezedPostModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FreezedPostModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FreezedPostModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,content,createdAt);

@override
String toString() {
  return 'FreezedPostModel(userId: $userId, content: $content, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$FreezedPostModelCopyWith<$Res> implements $FreezedPostModelCopyWith<$Res> {
  factory _$FreezedPostModelCopyWith(_FreezedPostModel value, $Res Function(_FreezedPostModel) _then) = __$FreezedPostModelCopyWithImpl;
@override @useResult
$Res call({
 String userId, String content,@JsonKey(fromJson: _fromTimestamp, toJson: _toTimestamp) DateTime createdAt
});




}
/// @nodoc
class __$FreezedPostModelCopyWithImpl<$Res>
    implements _$FreezedPostModelCopyWith<$Res> {
  __$FreezedPostModelCopyWithImpl(this._self, this._then);

  final _FreezedPostModel _self;
  final $Res Function(_FreezedPostModel) _then;

/// Create a copy of FreezedPostModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? content = null,Object? createdAt = null,}) {
  return _then(_FreezedPostModel(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
