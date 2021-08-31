abstract class BaseModel {
  Map<String, dynamic> toJson();
  String? makeId();

  @override
  String toString() => toJson().toString();
}
