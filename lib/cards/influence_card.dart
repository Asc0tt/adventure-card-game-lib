import 'package:adventure_card_game/localization/local_text.dart';

import 'card.dart';

class InfluenceCard extends Card {
  final int weight;
  final LocalText commonText;
  final List<InfluenceObjective> influenceObjectives;

  InfluenceCard(String id, CardMeta meta, LocalText header, this.weight, this.commonText, this.influenceObjectives) : super(id, meta, header);
}

class InfluenceObjective {
  final String iconPlaceholder;
  final int weight;
  final LocalText description;

  InfluenceObjective(this.iconPlaceholder, this.weight, this.description);
}