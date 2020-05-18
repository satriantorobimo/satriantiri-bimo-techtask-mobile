import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Counter App', () {
    final btnAddIngredients = find.byValueKey('add');
    final btnRemoveIngredients = find.byValueKey('remove');
    final btnOpenCalendar = find.byValueKey('btn_calendar');
    final btnOkCalendar = find.byValueKey('btn_ok');
    final btnChooseDate = find.byValueKey('btn_choose_date');
    final btnGoRecipe = find.byValueKey('btn_go_recipe');
    final txtTitle = find.byValueKey('txt_title');
    final txtFirstText = find.byValueKey('txt_date_first');
    final txtDateDialogText = find.byValueKey('txt_date_dialog');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('starts app open', () async {
      final firstText = find.byValueKey('txtDateDialogText');
      await driver.waitFor(find.text('Choos the date'));
    });
  });
}
