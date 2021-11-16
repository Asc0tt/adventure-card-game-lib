import 'package:adventure_card_game/models.dart';
import 'package:adventure_card_game/localization/local_text.dart';
import 'package:test/test.dart';

void main() {
  group('Card models', () {
    final actions1 = List<Action>.empty(growable: true);
    actions1.add(Action.typeOnly(ActionType.trashCard));

    final effects1 = List<Effect>.empty(growable: true);
    effects1.add(Effect(LocalText({'en':'first_effect'}), actions1));

    final actions2 = List<Action>.empty(growable: true);
    actions2.add(Action(ActionType.addCard, ['key1'], [ActionParameter.hide]));

    final effects2 = List<Effect>.empty(growable: true);
    effects2.add(Effect(LocalText({'en':'second_effect'}), actions2));

    final objectives = List<Objective>.empty(growable: true);
    objectives.add(Objective(
        LocalText({'en': 'first_objective'}),
        LocalText({'en': 'first_requirement'}),
        effects1));

    objectives.add(Objective(
        LocalText({'en': 'second_objective'}),
        LocalText({'en': 'second_requirement'}),
        effects2));

    final card = GoalCard(
        "key1",
        CardMeta(LocalText({'en': '001'}), 'basic'),
        LocalText({ 'en':'header' }),
        Story(LocalText({ 'en':'story' }), Effect.withNoEffect()),
        objectives);

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
