class ResultValue<T> {
  late final T _value;
  late final String _error;
  late bool _hasError;

  ResultValue<T> fromValue(T value) {
    var result = ResultValue<T>();
    result._setValue(value);
    return result;
  }

  ResultValue<T> fromError(String error) {
    var result = ResultValue<T>();
    result._setError(error);
    return result;
  }

  void _setError(String error) {
    _error = error;
  }

  void _setValue(T value) {
    _value = value;
  }

  bool isHasError () {
    return _hasError;
  }

  List tryGetValue() {
    if(isHasError()) {
      return [false, _error];
    }
    return [true, _value];
  }
}