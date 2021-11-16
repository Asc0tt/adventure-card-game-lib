import 'package:adventure_card_game/localization/local_text.dart';

import 'card.dart';
import 'card_effect.dart';
import 'story_card.dart';

class EncounterCard extends StoryCard {
  final List<EncounterOption> options;

  EncounterCard(String id, CardMeta meta, LocalText header, Story story, this.options) : super(id, meta, header, story);
}

abstract class EncounterOption {
}

class EncounterTest extends EncounterOption{
  final LocalText testText;
  final EncounterResult succeed;
  final EncounterResult fail;

  EncounterTest(this.testText, this.succeed, this.fail);
}

class EncounterNoTest extends EncounterOption{
  final EncounterResult pass;

  EncounterNoTest(this.pass);
}

class EncounterResult {
  final LocalText text;
  final List<Effect> effects;

  EncounterResult(this.text, this.effects);
}