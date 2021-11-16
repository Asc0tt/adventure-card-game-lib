import 'dart:math';

class CardShuffler<T> {
  final Random _random = Random();
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