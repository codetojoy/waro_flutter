import 'dart:math';

import './card.dart';

class Deck {
  int _numCards;
  List<Card> _cards = [];

  Deck(this._numCards) {
    _cards = new List<Card>.generate(_numCards, (i) => new Card(i + 1));
  }

  List<Card> get cards => _cards;

  void shuffle() {
    var rng = new Random();
    for (var i = _cards.length - 1; i > 0; i--) {
      final j = rng.nextInt(_cards.length);
      final temp = _cards[i];
      _cards[i] = _cards[j];
      _cards[j] = temp;
    }
  }

  String toString() {
    var result = "";
    _cards.forEach((c) {
      result += '$c ';
    });
    return result;
  }
}
