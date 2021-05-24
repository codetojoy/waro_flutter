import './card.dart';

abstract class Strategy {
  Card selectCard(List<Card> cards, int prizeCard, int maxCard);
}

enum StrategyType {
  next_card,
  max_card,
  min_card,
}

class Strategies {
  Strategy buildStrategy(StrategyType strategyType) {
    var strategy;
    switch (strategyType) {
      case StrategyType.next_card:
        {
          strategy = new _NextCard();
        }
        break;
      case StrategyType.max_card:
        {
          strategy = new _MaxCard();
        }
        break;
      case StrategyType.min_card:
        {
          strategy = new _MinCard();
        }
        break;
    }
    return strategy;
  }
}

class _NextCard extends Strategy {
  Card selectCard(List<Card> cards, int prizeCard, int maxCard) {
    return cards[0];
  }
}

class _MaxCard extends Strategy {
  Card selectCard(List<Card> cards, int prizeCard, int maxCard) {
    return cards
        .reduce((current, next) => current.value > next.value ? current : next);
  }
}

class _MinCard extends Strategy {
  Card selectCard(List<Card> cards, int prizeCard, int maxCard) {
    return cards
        .reduce((current, next) => current.value < next.value ? current : next);
  }
}
