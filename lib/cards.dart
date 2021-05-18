import './card.dart';

class Cards {
  int sum(List<Card> cards) {
    var result = 0;

    cards.forEach((card) {
      result += card.value;
    });

    return result;
  }
}
