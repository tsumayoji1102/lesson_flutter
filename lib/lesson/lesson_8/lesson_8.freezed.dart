// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_8.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FreezedCar {

 String get name;// デフォルト値を設定などできる
 String get brand; int get year; int get price; String? get ownerName;
/// Create a copy of FreezedCar
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FreezedCarCopyWith<FreezedCar> get copyWith => _$FreezedCarCopyWithImpl<FreezedCar>(this as FreezedCar, _$identity);

  /// Serializes this FreezedCar to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreezedCar&&(identical(other.name, name) || other.name == name)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.year, year) || other.year == year)&&(identical(other.price, price) || other.price == price)&&(identical(other.ownerName, ownerName) || other.ownerName == ownerName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,brand,year,price,ownerName);

@override
String toString() {
  return 'FreezedCar(name: $name, brand: $brand, year: $year, price: $price, ownerName: $ownerName)';
}


}

/// @nodoc
abstract mixin class $FreezedCarCopyWith<$Res>  {
  factory $FreezedCarCopyWith(FreezedCar value, $Res Function(FreezedCar) _then) = _$FreezedCarCopyWithImpl;
@useResult
$Res call({
 String name, String brand, int year, int price, String? ownerName
});




}
/// @nodoc
class _$FreezedCarCopyWithImpl<$Res>
    implements $FreezedCarCopyWith<$Res> {
  _$FreezedCarCopyWithImpl(this._self, this._then);

  final FreezedCar _self;
  final $Res Function(FreezedCar) _then;

/// Create a copy of FreezedCar
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? brand = null,Object? year = null,Object? price = null,Object? ownerName = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,ownerName: freezed == ownerName ? _self.ownerName : ownerName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _FreezedCar implements FreezedCar {
  const _FreezedCar({this.name = "", required this.brand, required this.year, required this.price, this.ownerName});
  factory _FreezedCar.fromJson(Map<String, dynamic> json) => _$FreezedCarFromJson(json);

@override@JsonKey() final  String name;
// デフォルト値を設定などできる
@override final  String brand;
@override final  int year;
@override final  int price;
@override final  String? ownerName;

/// Create a copy of FreezedCar
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FreezedCarCopyWith<_FreezedCar> get copyWith => __$FreezedCarCopyWithImpl<_FreezedCar>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FreezedCarToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FreezedCar&&(identical(other.name, name) || other.name == name)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.year, year) || other.year == year)&&(identical(other.price, price) || other.price == price)&&(identical(other.ownerName, ownerName) || other.ownerName == ownerName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,brand,year,price,ownerName);

@override
String toString() {
  return 'FreezedCar(name: $name, brand: $brand, year: $year, price: $price, ownerName: $ownerName)';
}


}

/// @nodoc
abstract mixin class _$FreezedCarCopyWith<$Res> implements $FreezedCarCopyWith<$Res> {
  factory _$FreezedCarCopyWith(_FreezedCar value, $Res Function(_FreezedCar) _then) = __$FreezedCarCopyWithImpl;
@override @useResult
$Res call({
 String name, String brand, int year, int price, String? ownerName
});




}
/// @nodoc
class __$FreezedCarCopyWithImpl<$Res>
    implements _$FreezedCarCopyWith<$Res> {
  __$FreezedCarCopyWithImpl(this._self, this._then);

  final _FreezedCar _self;
  final $Res Function(_FreezedCar) _then;

/// Create a copy of FreezedCar
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? brand = null,Object? year = null,Object? price = null,Object? ownerName = freezed,}) {
  return _then(_FreezedCar(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,ownerName: freezed == ownerName ? _self.ownerName : ownerName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
