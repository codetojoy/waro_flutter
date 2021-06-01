import './card.dart';
import '../util/constants.dart';

class Hand {
  final List<Card> _cards;

  const Hand(this._cards);

  get cards => _cards;

  void sort(String sortOrder) {
    switch (sortOrder) {
      case C.SORT_NONE:
        {
          // no-op
        }
        break;
      case C.SORT_ASC:
        {
          _cards.sort((Card a, Card b) => a.value.compareTo(b.value));
        }
        break;
      case C.SORT_DESC:
        {
          _cards.sort((Card a, Card b) => b.value.compareTo(a.value));
        }
        break;
    }
  }

  bool contains(Card card) {
    return _cards.where((c) => c.value == card.value).toList().length > 0;
  }

  Hand updateHand(Card choice) {
    _cards.removeWhere((c) => c.value == choice.value);
    var hand = new Hand(_cards);
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
