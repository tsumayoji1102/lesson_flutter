// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_8.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FreezedCar _$FreezedCarFromJson(Map<String, dynamic> json) => _FreezedCar(
  name: json['name'] as String? ?? "",
  brand: json['brand'] as String,
  year: (json['year'] as num).toInt(),
  price: (json['price'] as num).toInt(),
  ownerName: json['ownerName'] as String?,
);

Map<String, dynamic> _$FreezedCarToJson(_FreezedCar instance) =>
    <String, dynamic>{
      'name': instance.name,
      'brand': instance.brand,
      'year': instance.year,
      'price': instance.price,
      'ownerName': instance.ownerName,
    };
