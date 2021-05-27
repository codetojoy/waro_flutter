import './card.dart';

class Cards {
  int sum(List<Card> cards) {
    return cards.fold(0, (value, card) => value + card.value);
  }
}
