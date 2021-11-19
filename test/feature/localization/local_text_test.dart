import 'package:adventure_card_game/localization/local_text.dart';
import 'package:test/test.dart';


void main() {
  group('Local text', () {
    final goodText = LocalText({'en':"text", 'ru': 'текст', 'ja': 'テキスト', 'ar': 'نص'});
    final emptyText = LocalText.createEmptyField();

    test('validating_local_text_model', () {
      expect(goodText.getLocalizedText('en'), 'text');
      expect(goodText.getLocalizedText('ru'), 'текст');
      expect(goodText.getLocalizedText('ja'), 'テキスト');
      expect(goodText.getLocalizedText('ar'), 'نص');
      expect(goodText.isEmpty(), false);
    });

    test('on_not_exists_lan_return', () {
      expect(goodText.getLocalizedText('not_exists_locale'), 'null');
      expect(goodText.isEmpty(), false);

      expect(emptyText.getLocalizedText('not_exists_locale'), 'null');
      expect(emptyText.isEmpty(), true);
    });
  });
}
