import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ingredients.g.dart';

class IngredientsModel extends Equatable {
  final List<IngredientsObject> ingredientsList;

  IngredientsModel({this.ingredientsList});

  factory IngredientsModel.fromJson(List<dynamic> parsedJson) {
    List<IngredientsObject> ingredientsList = <IngredientsObject>[];
    ingredientsList =
        parsedJson.map((i) => IngredientsObject.fromJson(i)).toList();

    return IngredientsModel(ingredientsList: ingredientsList);
  }
}

@JsonSerializable()
class IngredientsObject {
  String title;
  String useBy;

  IngredientsObject({this.title, this.useBy});

  factory IngredientsObject.fromJson(Map<String, dynamic> json) =>
      _$IngredientsObjectFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientsObjectToJson(this);
}
