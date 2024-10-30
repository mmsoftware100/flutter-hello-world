// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bottle _$BottleFromJson(Map<String, dynamic> json) => Bottle(
      id: (json['id'] as num?)?.toInt() ?? 0,
      photoUrl: json['photo_url'] as String? ?? '',
      name: json['name'] as String? ?? '',
      price: (json['price'] as num?)?.toInt() ?? 0,
      favourite: json['favourite'] as bool? ?? false,
    );

Map<String, dynamic> _$BottleToJson(Bottle instance) => <String, dynamic>{
      'id': instance.id,
      'photo_url': instance.photoUrl,
      'name': instance.name,
      'price': instance.price,
      'favourite': instance.favourite,
    };
