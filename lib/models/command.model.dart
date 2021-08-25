import 'package:json_annotation/json_annotation.dart';
import 'package:smooth/models/base.model.dart';

part 'command.model.g.dart';

@JsonSerializable()
class Command extends BaseModel {
  String clientName;
  String location;
  int amount;
  String flavourName;
  int qty;

  Command({
    this.amount = 0,
    this.clientName = "Nom du client",
    this.location = "Cotonou",
    this.flavourName = "",
    this.qty = 0,
  });
  factory Command.fromJson(Map<String, dynamic> json) =>
      _$CommandFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$CommandToJson(this);

  @override
  String? makeId() {
    // TODO: implement makeId
  }
}
