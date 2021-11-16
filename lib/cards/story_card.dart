import 'package:adventure_card_game/cards/card.dart';
import 'package:adventure_card_game/cards/card_effect.dart';
import 'package:adventure_card_game/localization/local_text.dart';

abstract class StoryCard extends Card {
  final Story story;

  StoryCard(String id, CardMeta meta, LocalText header, this.story) : super(id, meta, header);
}

class Story {
  final LocalText storyText;
  final Effect storyEffects;

  Story(this.storyText, this.storyEffects);
}