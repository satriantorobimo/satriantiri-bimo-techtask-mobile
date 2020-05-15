import 'package:tech_task/api/ingredients_api.dart';
import 'package:tech_task/model/ingredients/ingredients.dart';

class IngredientsRepository {
  final IngredientsApi ingredientsApi = IngredientsApi();

  Future<IngredientsModel> getIngredients() => ingredientsApi.getIngredients();
}
