class LocalText {
  // key: lang, value: localizedText
  final Map<String,String> _translates;
  static final notDefinedLangText = 'null';

  LocalText(this._translates);

  static LocalText createEmptyField() {
    return LocalText(<String,String>{});
  }

  String? getLocalizedText (String langKey) {
    if(isEmpty()) {
      return notDefinedLangText;
    }
    var result = _translates[langKey];

    if(result == null) {
      return notDefinedLangText;
    }
    return result;
  }

  bool isEmpty() => _translates.isEmpty;
}