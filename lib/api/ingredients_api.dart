import 'package:tech_task/model/ingredients/ingredients.dart';
import 'package:tech_task/util/url_util.dart';

class IngredientsApi {
  final URLUtil _urlUtil = URLUtil();

  IngredientsModel ingredientsModel;

  Future<IngredientsModel> getIngredients() async {
    final Map<String, String> _header = _urlUtil.getHeaderType();

    return await _urlUtil
        .get(_urlUtil.getIngredientsURL(), headers: _header)
        .then((dynamic res) {
      ingredientsModel = IngredientsModel.fromJson(res);
      return ingredientsModel;
    });
  }
}
