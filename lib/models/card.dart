import '../util/logger.dart';

class Card {
  int _value = 0;

  Card(this._value);

  get value => _value;

  factory Card.fromJson(Map<String, dynamic> json) {
    var msg = json['message'];
    L.log('REST message: $msg');
    return Card(json['card']);
  }

  String toString() {
    return '$_value';
  }
}
