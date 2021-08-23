// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flavour.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Flavour _$FlavourFromJson(Map<String, dynamic> json) {
  return Flavour(
    name: json['name'] as String?,
    price: json['price'] as int?,
  );
}

Map<String, dynamic> _$FlavourToJson(Flavour instance) => <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
    };
