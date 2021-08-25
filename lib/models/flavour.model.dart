import 'package:json_annotation/json_annotation.dart';
import 'package:smooth/models/base.model.dart';
part 'flavour.model.g.dart';

@JsonSerializable()
class Flavour extends BaseModel {
  final String? name;
  final int? price;

  Flavour({required this.name, required this.price});
  factory Flavour.fromJson(Map<String, dynamic> json) =>
      _$FlavourFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FlavourToJson(this);

  @override
  String? makeId() {
    // TODO: implement makeId
  }
}
