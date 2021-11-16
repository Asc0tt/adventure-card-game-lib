import 'package:adventure_card_game/localization/local_text.dart';

abstract class Card {
  final String id;
  final CardMeta meta;
  final LocalText header;

  Card(this.id, this.meta, this.header);
}

class CardMeta {
  final LocalText cardNumber;
  final String cardSetKey;

  CardMeta(this.cardNumber, this.cardSetKey);
}



