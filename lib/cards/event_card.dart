import 'package:adventure_card_game/cards/card.dart';
import 'package:adventure_card_game/cards/story_card.dart';
import 'package:adventure_card_game/localization/local_text.dart';

class EventCard extends StoryCard {
  EventCard(String id, CardMeta meta, LocalText header, Story story) : super(id, meta, header, story);
}