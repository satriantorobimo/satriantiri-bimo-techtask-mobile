import 'package:tech_task/model/recipe/recipe.dart';
import 'package:tech_task/util/url_util.dart';

class RecipesApi {
  final URLUtil _urlUtil = URLUtil();

  RecepieModel recipesModel;

  Future<RecepieModel> getRecipes({List<String> data}) async {
    final Map<String, String> _header = _urlUtil.getHeaderType();
    final StringBuffer datas = StringBuffer();
    // data.forEach((String item) {
    //   datas.write(item + ',');
    // });

    for (final String item in data) {
      datas.write(item + ',');
    }

    print('data baru : $datas');
    return await _urlUtil
        .get(_urlUtil.getRecipieURL() + datas.toString(), headers: _header)
        .then((dynamic res) {
      recipesModel = RecepieModel.fromJson(res);
      return recipesModel;
    });
  }
}
