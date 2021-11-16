import 'deck.dart';

class CardSet {
  String delimiter;
  final List<Deck> decks;
  CardSet(this.decks, this.delimiter);
}