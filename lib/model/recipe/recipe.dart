import 'package:json_annotation/json_annotation.dart';
part 'recipe.g.dart';

@JsonSerializable()
class RecepieModel {
  String title;
  List<String> ingredients;

  RecepieModel({this.title, this.ingredients});

  factory RecepieModel.fromJson(Map<String, dynamic> json) =>
      _$RecepieModelFromJson(json);
  Map<String, dynamic> toJson() => _$RecepieModelToJson(this);
}
