import './card.dart';

abstract class Strategy {
  Card selectCard(List<Card> cards, int prizeCard, int maxCard);
}

class Strategies {
  Strategy buildStrategy(String name) {
    return new _NextCard();
  }
}

class _NextCard extends Strategy {
  Card selectCard(List<Card> cards, int prizeCard, int maxCard) {
    return cards[0];
  }
}
