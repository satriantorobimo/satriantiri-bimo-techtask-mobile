import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tech_task/model/recipe/recipe.dart';

abstract class RecipiesState extends Equatable {
  RecipiesState([List props = const []]) : super(props);
}

class InitialRecipiesState extends RecipiesState {}

class RecipiesLoading extends RecipiesState {}

class RecipiesSuccess extends RecipiesState {
  final List<RecepieObject> recipesList;

  RecipiesSuccess({@required this.recipesList})
      : assert(recipesList != null),
        super([recipesList]);
}

class RecipiesException extends RecipiesState {
  final Exception exception;

  RecipiesException({@required this.exception})
      : assert(exception != null),
        super([exception]);
}
