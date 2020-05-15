import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tech_task/model/ingredients/ingredients.dart';
import 'package:tech_task/repo/ingredients_repo.dart';
import './bloc.dart';

class IngredientsBloc extends Bloc<IngredientsEvent, IngredientsState> {
  final IngredientsRepository ingredientsRepository;

  IngredientsBloc({@required this.ingredientsRepository})
      : assert(ingredientsRepository != null);

  @override
  IngredientsState get initialState => InitialIngredientsState();

  @override
  Stream<IngredientsState> mapEventToState(
    IngredientsEvent event,
  ) async* {
    if (event is GetIngredients) {
      yield* _getIngredientsData(event);
    }
  }

  Stream<IngredientsState> _getIngredientsData(GetIngredients event) async* {
    yield IngredientsLoading();

    try {
      final IngredientsModel result =
          await ingredientsRepository.getIngredients();
      yield IngredientsSuccess(ingredientsList: result.ingredientsList);
    } catch (e) {
      yield IngredientsException(exception: e);
    }
  }
}
