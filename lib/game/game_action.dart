class Action {
  final ActionType type;
  final List<ActionParameter> parameters;
  final List<String> arguments;

  Action(this.type, this.arguments, this.parameters);

  Action.typeWithArgs(this.type, this.arguments)
      : parameters = [];
  Action.typeOnly(this.type)
      : arguments = [],
        parameters = [];
}

enum ActionType {
  none,
  addCard,
  stageCard,
  discardCard,
  trashCard,

}

enum ActionParameter {
  none,
  hide,
  random,
  shuffleInDeck,
  ifDeckAreEmpty,

}
