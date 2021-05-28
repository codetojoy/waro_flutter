import './card.dart';

abstract class Strategy {
  Card selectCard(List<Card> cards, int prizeCard, int maxCard);
}

enum StrategyType {
  max_card,
  min_card,
  next_card,
  nearest_card,
}

class Strategies {
  Strategy buildStrategy(StrategyType strategyType) {
    var strategy;
    switch (strategyType) {
      case StrategyType.nearest_card:
        {
          strategy = new _NearestCard();
        }
        break;
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

class _NearestCard extends Strategy {
  Card selectCard(List<Card> cards, int prizeCard, int maxCard) {
    var nearestDistance = maxCard * 2;
    return cards.reduce((acc, card) {
      var result = acc;
      var distance = (card.value - prizeCard).abs();
      if (distance < nearestDistance) {
        nearestDistance = distance;
        result = card;
      }
      return result;
    });
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
