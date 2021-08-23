// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Client _$ClientFromJson(Map<String, dynamic> json) {
  return Client(
    name: json['name'] as String?,
    phoneNumber: json['phoneNumber'] as String?,
    amountSpended: json['amountSpended'] as int?,
    birthday: json['birthday'] == null
        ? null
        : DateTime.parse(json['birthday'] as String),
  );
}

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'amountSpended': instance.amountSpended,
      'birthday': instance.birthday?.toIso8601String(),
    };
