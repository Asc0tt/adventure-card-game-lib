import 'package:adventure_card_game/models.dart';
import 'package:test/test.dart';

import '../helpers/card_builder.dart';

void main() {
  group('Card models', () {

    var builder = CardBuilder();
    var card = builder.createGoalCard(1);

    test('validating_goal_card_model', () {
      expect(card.id, 'key1');
      expect(card.meta.cardNumber.getLocalizedText('en'), '001');
      expect(card.meta.cardSetKey, 'basic');

      expect(card.header.getLocalizedText('en'), 'header');

      expect(card.story.storyText.getLocalizedText('en'), 'story');
      expect(card.story.storyEffects.isEmpty(), true);

      expect(card.objectives.length, 2);

      expect(card.objectives[0].text.getLocalizedText('en'), 'first_objective');
      expect(card.objectives[0].requirements.getLocalizedText('en'), 'first_requirement');
      expect(card.objectives[0].effects.length, 1);
      expect(card.objectives[0].effects[0].text.getLocalizedText('en'), 'first_effect');
      expect(card.objectives[0].effects[0].actions.length, 1);
      expect(card.objectives[0].effects[0].actions[0].type, ActionType.trashCard);
      expect(card.objectives[0].effects[0].actions[0].arguments.length, 0);
      expect(card.objectives[0].effects[0].actions[0].parameters.length, 0);

      expect(card.objectives[1].text.getLocalizedText('en'), 'second_objective');
      expect(card.objectives[1].requirements.getLocalizedText('en'), 'second_requirement');
      expect(card.objectives[1].effects.length, 1);
      expect(card.objectives[1].effects[0].text.getLocalizedText('en'), 'second_effect');
      expect(card.objectives[1].effects[0].actions.length, 1);
      expect(card.objectives[1].effects[0].actions[0].type, ActionType.addCard);
      expect(card.objectives[1].effects[0].actions[0].arguments.length, 1);
      expect(card.objectives[1].effects[0].actions[0].arguments[0], 'key1');
      expect(card.objectives[1].effects[0].actions[0].parameters.length, 1);
      expect(card.objectives[1].effects[0].actions[0].parameters[0], ActionParameter.hide);
    });
  });
}
