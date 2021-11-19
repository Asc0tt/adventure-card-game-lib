import 'package:adventure_card_game/cards/goal_card.dart';
import 'package:adventure_card_game/src/shuffler/card_shuffler.dart';
import 'package:test/test.dart';

import '../../helpers/card_builder.dart';

final _shuffler = CardShuffler<GoalCard>(3225);
final _builder = CardBuilder();

void main() {
  group('Card shuffler', () {
    final cardCount = 10;
    final cards = List<GoalCard>.empty(growable: true);

    for(var i = 0; i < cardCount; i++) {
      cards.add(_builder.createGoalCard((i)));
    }

    test('when_shuffle_at_least_two_cards_are_moved', () {
      final result = _shuffler.shuffle(cards);
      var shuffledCards = 0;
      var missedLinks = 0;
      for(var index = 0; index < result.length; index++) {
        var card = result[index];
        var cardId = int.parse(card.id.substring(3));
        if(cardId != index) {
          shuffledCards++;
        }

        if(!identical(card, cards[cardId])) {
          missedLinks++;
        }
      }
      //may be flaky, because base on random
      expect(shuffledCards, greaterThanOrEqualTo(2));
      expect(result.length, cards.length);
      expect(missedLinks, 0);
    });
  });
}

