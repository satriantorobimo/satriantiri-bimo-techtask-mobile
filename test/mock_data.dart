class MockJsonString {
  static String responseIngredients = '[\n' +
      '{\n' +
      '\"title\": \"Ham\",\n' +
      '\"use-by\": \"2020-11-25\"\n' +
      '},\n'
          '{\n' +
      '\"title\": \"Cheese\",\n' +
      '\"use-by\": \"2020-01-08\"\n' +
      '}\n'
          ']';

  static String responseRecipes = '[\n' +
      '{\n' +
      '\"title\": \"Ham and Cheese Toastie\",\n' +
      '\"ingredients\": [\n' +
      '\"Ham\",\n' +
      '\"Cheese\",\n' +
      '\"Bread\",\n' +
      '\"Butter\"\n' +
      ']\n' +
      '},\n'
          '{\n' +
      '\"title\": \"Salad\",\n' +
      '\"ingredients\": [\n' +
      '\"Lettuce\",\n' +
      '\"Tomato\",\n' +
      '\"Cucumber\",\n' +
      '\"Beetroot\",\n' +
      '\"Salad Dressing\"\n' +
      ']\n' +
      '}\n'
          ']';

  static List<String> requestRecipies = ['Ham', 'Bread'];
}
