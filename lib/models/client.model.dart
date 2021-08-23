import 'package:json_annotation/json_annotation.dart';

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
}
