import 'dart:math';

class CardShuffler<T> {
  final int _seed;
  late final Random _random;

  CardShuffler(this._seed){
    _random = Random(_seed);
  }

  List<T> shuffle(List<T> cards) {
    var result = List<T>.from(cards);
    for(var index = 0; index < cards.length; index++){
      var card = result[index];
      var newIndex = _random.nextInt(cards.length);
      result[index] = result[newIndex];
      result[newIndex] = card;
    }
    return result;
  }
}