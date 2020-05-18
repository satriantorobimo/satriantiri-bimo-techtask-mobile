import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tech_task/api/ingredients_api.dart';
import 'package:tech_task/bloc/ingredients/bloc.dart';
import 'package:tech_task/model/ingredients/ingredients.dart';
import 'package:tech_task/repo/ingredients_repo.dart';

import 'mock_data.dart';

class MockApi extends Mock implements IngredientsApi {}

class MockRepo extends Mock implements IngredientsRepository {}

BuildContext context;
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  IngredientsRepository ingredientsRepository;
  IngredientsModel mockIngreData;
  IngredientsBloc ingredientsBloc;

  setUp(() {
    ingredientsRepository = MockRepo();
    ingredientsBloc =
        IngredientsBloc(ingredientsRepository: ingredientsRepository);

    IngredientsModel result = IngredientsModel();
    final dynamic responseJson =
        json.decode(MockJsonString.responseIngredients);
    result = IngredientsModel.fromJson(responseJson);
    mockIngreData = result;
  });

  tearDown(() {
    ingredientsBloc?.dispose();
  });

  test('Test Initial State', () {
    expect(ingredientsBloc.initialState, InitialIngredientsState());
  });

  test('Get Data Success', () async {
    when(ingredientsRepository.getIngredients())
        .thenAnswer((_) async => Future.value(mockIngreData));
    expectLater(
        ingredientsBloc.state,
        emitsInOrder([
          InitialIngredientsState(),
          IngredientsLoading(),
          IngredientsSuccess(ingredientsList: mockIngreData.ingredientsList)
        ]));

    ingredientsBloc.dispatch(GetIngredients());
  });
}
