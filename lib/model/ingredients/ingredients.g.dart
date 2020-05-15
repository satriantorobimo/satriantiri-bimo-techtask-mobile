// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredients.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngredientsObject _$IngredientsObjectFromJson(Map<String, dynamic> json) {
  return IngredientsObject(
    title: json['title'] as String,
    useBy: json['use-by'] as String,
  );
}

Map<String, dynamic> _$IngredientsObjectToJson(IngredientsObject instance) =>
    <String, dynamic>{
      'title': instance.title,
      'use-by': instance.useBy,
    };
