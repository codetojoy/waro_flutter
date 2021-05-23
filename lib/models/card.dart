class Card {
  int _value = 0;

  Card(this._value);

  get value => _value;

  String toString() {
    return '$_value';
  }
}
