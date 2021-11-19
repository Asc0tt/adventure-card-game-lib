import 'package:adventure_card_game/localization/lang.dart';
import 'package:test/test.dart';


void main() {
  group('Lang', () {
    var goodLang = Lang('ru', {'ru': 'Русский', 'en':'Russian'});

    test('validating_local_text_model', () {
      expect(goodLang.key, 'ru');
      expect(goodLang.isEmpty(), false);
      expect(goodLang.getLocalizedText('ru'), 'Русский');
      expect(goodLang.getLocalizedText('en'), 'Russian');
    });
  });
}
