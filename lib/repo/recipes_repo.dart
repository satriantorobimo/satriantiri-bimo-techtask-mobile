import 'package:tech_task/api/recipes_api.dart';
import 'package:tech_task/model/recipe/recipe.dart';

class RecipesRepository {
  final RecipesApi recipesApi = RecipesApi();

  Future<RecepieModel> getRecipes(List<String> data) =>
      recipesApi.getRecipes(data: data);
}
