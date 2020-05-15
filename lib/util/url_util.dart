import 'dart:convert';

import 'package:http/http.dart' as http;

class URLUtil {
  String baseUrl =
      'https://lb7u7svcm5.execute-api.ap-southeast-1.amazonaws.com/dev';

  static final Map<String, String> headerType = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };

  final JsonDecoder _decoder = const JsonDecoder();

  Map<String, String> getHeaderType() {
    return headerType;
  }

  static String getIngredients() => '/ingredients';

  String getIngredientsURL() {
    return baseUrl + getIngredients();
  }

  static String getRecipie() => '/recipes?ingredients=';

  String getRecipieURL() {
    return baseUrl + getRecipie();
  }

  Future<dynamic> get(String url, {Map headers}) async {
    return http.get(url, headers: headers).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      print(url);
      print(response.statusCode);
      print(response.body);

      if (statusCode == 200 ||
          statusCode == 201 ||
          statusCode == 202 ||
          statusCode == 206 ||
          statusCode == 401 ||
          statusCode == 403) {
        return _decoder.convert(res);
      } else {
        throw Exception('Error while fetching data');
      }
    }).catchError((err) => throw Exception(
        'Error while fetching data')); //.timeout(Duration(milliseconds: 10000));
  }
}
