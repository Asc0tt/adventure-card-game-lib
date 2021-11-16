import 'package:adventure_card_game/game/game_action.dart';
import 'package:adventure_card_game/localization/local_text.dart';

class Effect {
  final LocalText text;
  final List<Action> actions;
  late bool _isEmpty;

  Effect(this.text, this.actions){
    _isEmpty = false;
  }
  
  static Effect withNoEffect() {
    var effect = Effect(LocalText.createEmptyField(), List.empty(growable: false));
    effect._isEmpty = true;
    return effect;
  }

  bool isEmpty() => _isEmpty;
}