import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tech_task/model/recipe/recipe.dart';
import 'package:tech_task/repo/recipes_repo.dart';
import './bloc.dart';

class RecipiesBloc extends Bloc<RecipiesEvent, RecipiesState> {
  final RecipesRepository recipesRepository;

  RecipiesBloc({@required this.recipesRepository})
      : assert(recipesRepository != null);

  @override
  RecipiesState get initialState => InitialRecipiesState();

  @override
  Stream<RecipiesState> mapEventToState(
    RecipiesEvent event,
  ) async* {
    if (event is GetRecipes) {
      yield* _getRecipesData(event);
    }
  }

  Stream<RecipiesState> _getRecipesData(GetRecipes event) async* {
    yield RecipiesLoading();

    try {
      final RecepieModel result =
          await recipesRepository.getRecipes(event.data);
      yield RecipiesSuccess(recipesList: result.recepiesList);
    } catch (e) {
      yield RecipiesException(exception: e);
    }
  }
}
