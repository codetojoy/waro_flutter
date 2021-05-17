import './card.dart';
import './hand.dart';
import './playerstats.dart';
import './strategy.dart';

class Player {
  String _name;
  Hand _hand;
  Strategy _strategy;
  bool _isUser = false;
  PlayerStats _playerStats = new PlayerStats();
  int _maxCard = 0;

  Player(String name, Strategy strategy, bool isUser, int maxCard) {
    _name = name;
    _strategy = strategy;
    _hand = new Hand([]);
    _isUser = isUser;
    _maxCard = maxCard;
  }

  Player.kitty(String name, Hand hand, Strategy strategy) {
    _name = name;
    _strategy = strategy;
    _hand = hand;
  }

  List<Card> get cards => _hand.cards;

  Hand get hand => _hand;
  set hand(Hand hand) => _hand = hand;

  bool get isUser => _isUser;
  PlayerStats get playerStats => _playerStats;
  String get name => _name;

  void winsRound(Card prizeCard) {
    _playerStats.incNumRoundsWon();
    _playerStats.addPoints(prizeCard.value);
  }

  void updateHand(Card choice) {
    _hand = hand.updateHand(choice);
  }

  Card selectCard(Card prizeCard) {
    return _strategy.selectCard(_hand.cards, prizeCard.value, _maxCard);
  }

  String toString() {
    var result = '$_name $_hand';
    return result;
  }
}

class Kitty extends Player {
  Kitty(Hand hand)
      : super.kitty('kitty', hand, new Strategies().buildStrategy('next'));

  String toString() {
    return super.toString();
  }
}
