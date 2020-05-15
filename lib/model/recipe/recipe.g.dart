// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecepieModel _$RecepieModelFromJson(Map<String, dynamic> json) {
  return RecepieModel(
    title: json['title'] as String,
    ingredients:
        (json['ingredients'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$RecepieModelToJson(RecepieModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'ingredients': instance.ingredients,
    };
