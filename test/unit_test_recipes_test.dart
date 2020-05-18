import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tech_task/api/recipes_api.dart';
import 'package:tech_task/bloc/recipies/bloc.dart';
import 'package:tech_task/model/recipe/recipe.dart';
import 'package:tech_task/repo/recipes_repo.dart';

import 'mock_data.dart';

class MockApi extends Mock implements RecipesApi {}

class MockRepo extends Mock implements RecipesRepository {}

BuildContext context;
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  RecipesRepository recipesRepository;
  RecepieModel mockRecipesData;
  RecipiesBloc recipiesBloc;

  setUp(() {
    recipesRepository = MockRepo();
    recipiesBloc = RecipiesBloc(recipesRepository: recipesRepository);

    RecepieModel result = RecepieModel();
    final dynamic responseJson = json.decode(MockJsonString.responseRecipes);
    result = RecepieModel.fromJson(responseJson);
    mockRecipesData = result;
  });

  tearDown(() {
    recipiesBloc?.dispose();
  });

  test('Test Initial State', () {
    expect(recipiesBloc.initialState, InitialRecipiesState());
  });

  test('Get Data Success', () async {
    when(recipesRepository.getRecipes(MockJsonString.requestRecipies))
        .thenAnswer((_) async => Future.value(mockRecipesData));
    expectLater(
        recipiesBloc.state,
        emitsInOrder([
          InitialRecipiesState(),
          RecipiesLoading(),
          RecipiesSuccess(recipesList: mockRecipesData.recepiesList)
        ]));

    recipiesBloc.dispatch(GetRecipes(data: MockJsonString.requestRecipies));
  });
}
