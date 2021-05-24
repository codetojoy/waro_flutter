import './card.dart';

abstract class Strategy {
  Card selectCard(List<Card> cards, int prizeCard, int maxCard);
}

enum StrategyType {
  next_card,
}

class Strategies {
  Strategy buildStrategy(StrategyType strategyType) {
    return new _NextCard();
  }
}

class _NextCard extends Strategy {
  Card selectCard(List<Card> cards, int prizeCard, int maxCard) {
    return cards[0];
  }
}
