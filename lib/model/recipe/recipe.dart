import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'recipe.g.dart';

class RecepieModel extends Equatable {
  List<RecepieObject> recepiesList;

  RecepieModel({this.recepiesList});

  factory RecepieModel.fromJson(List<dynamic> parsedJson) {
    List<RecepieObject> recepiesList = List<RecepieObject>();
    recepiesList = parsedJson.map((i) => RecepieObject.fromJson(i)).toList();

    return RecepieModel(recepiesList: recepiesList);
  }
}

@JsonSerializable()
class RecepieObject {
  String title;
  List<String> ingredients;

  RecepieObject({this.title, this.ingredients});

  factory RecepieObject.fromJson(Map<String, dynamic> json) =>
      _$RecepieObjectFromJson(json);
  Map<String, dynamic> toJson() => _$RecepieObjectToJson(this);
}
