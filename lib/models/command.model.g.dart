// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'command.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Command _$CommandFromJson(Map<String, dynamic> json) {
  return Command(
    amount: json['amount'] as int,
    clientName: json['clientName'] as String,
    location: json['location'] as String,
    flavourName: json['flavourName'] as String,
    qty: json['qty'] as int,
  );
}

Map<String, dynamic> _$CommandToJson(Command instance) => <String, dynamic>{
      'clientName': instance.clientName,
      'location': instance.location,
      'amount': instance.amount,
      'flavourName': instance.flavourName,
      'qty': instance.qty,
    };
