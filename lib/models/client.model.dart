import 'package:json_annotation/json_annotation.dart';

part 'client.model.g.dart';

@JsonSerializable()
class Client {
  final String? name;
  final String? phoneNumber;
  final int? amountSpended;
  final DateTime? birthday;

  Client({
    this.name,
    this.phoneNumber,
    this.amountSpended,
    this.birthday,
  });

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
  Map<String, dynamic> toJson() => _$ClientToJson(this);
}
