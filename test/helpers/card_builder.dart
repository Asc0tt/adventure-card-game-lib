import 'package:adventure_card_game/cards/goal_card.dart';
import 'package:adventure_card_game/localization/local_text.dart';
import 'package:adventure_card_game/models.dart';

class CardBuilder {
  GoalCard createGoalCard(int cardNumber) {
    var cardKey = 'key$cardNumber';
    var cardNUmber = cardNumber.toString().padLeft(3, '0');

    final actions1 = List<Action>.empty(growable: true);
    actions1.add(Action.typeOnly(ActionType.trashCard));

    final effects1 = List<Effect>.empty(growable: true);
    effects1.add(Effect(LocalText({'en':'first_effect'}), actions1));

    final actions2 = List<Action>.empty(growable: true);
    actions2.add(Action(ActionType.addCard, [cardKey], [ActionParameter.hide]));

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

    return GoalCard(
        cardKey,
        CardMeta(LocalText({'en': cardNUmber}), 'basic'),
        LocalText({ 'en':'header' }),
        Story(LocalText({ 'en':'story' }), Effect.withNoEffect()),
        objectives);
  }
}