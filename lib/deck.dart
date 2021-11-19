import 'dart:collection';

import 'package:adventure_card_game/cards/card.dart';
import 'package:adventure_card_game/src/shuffler/card_shuffler.dart';

class Deck {
  final String name;
  final DeckType deckType;

  final DeckBehavior _behavior;

  final Queue<Card> _cards = Queue<Card>();
  final List<Card> _discardPile = List.empty(growable: true);

  final int _seed;
  late final CardShuffler<Card> _shuffler;

  Deck(this.name, this.deckType, this._behavior, this._seed) {
    _shuffler = CardShuffler<Card>(_seed);
  }

  bool isEmpty() => _cards.isEmpty;
  int deckCount() => _cards.length;
  int discardPileCount() => _discardPile.length;

  List tryGetNextCard(){
    if (isEmpty()) {
      return [true, _dequeueCard()];
    }
    return [false, null];
  }

  Card _dequeueCard() {
    var card = _cards.first;
    _cards.removeFirst();
    if(isEmpty()) {
      _onLastCardAction();
    }
    return card;
  }

  void completeCard(Card card) {
    switch (_behavior.onCardCompleteAction) {
      case OnCardCompleteAction.none:
        break;
      case OnCardCompleteAction.toBottom:
        _cards.addLast(card);
        break;
      case OnCardCompleteAction.toDiscardPile:
        _discardPile.add(card);
        break;
    }
  }

  void _onLastCardAction() {
    switch(_behavior.afterLastCardAction){
      case AfterLastCardAction.none:
        break;
      case AfterLastCardAction.shuffleDiscard:
        _fillDeckFromShuffledDiscardPile();
        break;
    }
  }

  void _fillDeckFromShuffledDiscardPile() {
    var newDeck = _shuffler.shuffle(_discardPile);
    _discardPile.clear();
    _cards.addAll(newDeck);
  }
}

class DeckBehavior {
  final OnCardCompleteAction onCardCompleteAction;
  final AfterLastCardAction afterLastCardAction;
  const DeckBehavior(this.onCardCompleteAction, this.afterLastCardAction);
}

enum DeckType {
  undefined,
  goal,
  encounter,
  event
}

enum OnCardCompleteAction {
  none,
  toBottom,
  toDiscardPile
}

enum AfterLastCardAction {
  none,
  shuffleDiscard
}