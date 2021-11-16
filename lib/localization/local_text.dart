class LocalText {
  // key: lang, value: localizedText
  final Map<String,String> _translates;

  LocalText(this._translates);

  static LocalText createEmptyField() {
    return LocalText(<String,String>{});
  }

  String getLocalizedText (String langKey) {
    var result = _translates[langKey];
    if(result == null) {
      return "localized text not found for specific language: $langKey";
    }
    return result;
  }

  bool isEmpty() => _translates.isEmpty;
}