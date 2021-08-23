import 'package:json_annotation/json_annotation.dart';
part 'flavour.model.g.dart';

@JsonSerializable()
class Flavour {
  final String? name;
  final int? price;

  const Flavour({required this.name, required this.price});
  factory Flavour.fromJson(Map<String, dynamic> json) =>
      _$FlavourFromJson(json);
  Map<String, dynamic> toJson() => _$FlavourToJson(this);
}
