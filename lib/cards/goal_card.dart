import 'package:adventure_card_game/cards/card.dart';
import 'package:adventure_card_game/cards/card_effect.dart';
import 'package:adventure_card_game/cards/story_card.dart';
import 'package:adventure_card_game/localization/local_text.dart';

class GoalCard extends StoryCard {
  final List<Objective> objectives;

  GoalCard(String id, CardMeta meta, LocalText header, Story story, this.objectives) : super(id, meta, header, story);
}

class Objective {
  final LocalText text;
  final LocalText requirements;
  final List<Effect> effects;

  Objective(this.text, this.requirements, this.effects);
}