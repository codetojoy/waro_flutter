import './card.dart';

class Hand {
  List<Card> _cards;

  Hand(this._cards);

  get cards => _cards;

  // TODO: sort-order should be a config setting?
  void sort() {
    _cards.sort((Card a, Card b) => a.value.compareTo(b.value));
  }

  Hand updateHand(Card choice) {
    var newCards = _cards.where((c) => c.value != choice.value).toList();
    var hand = new Hand(newCards);
    return hand;
  }

  String toString() {
    var result = '[';
    var numCards = _cards.length;
    var counter = 0;
    _cards.forEach((c) {
      var isLast = counter == numCards - 1;
      result += c.toString();
      if (!isLast) {
        result += ', ';
      }
      counter++;
    });
    result += ']';
    return result;
  }
}
