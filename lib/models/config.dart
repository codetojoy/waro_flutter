import '../util/logger.dart';
import './player.dart';
import './strategy.dart';

class Config {
  int numCards = 20;
  List<Player> _players = [];

  Config() {
    var maxCard = numCards;
    var nextCard = new Strategies().buildStrategy('next');
    var p1 = new Player('You', nextCard, true, maxCard);
    var p2 = new Player('Mozart', nextCard, false, maxCard);
    var p3 = new Player('Chopin', nextCard, false, maxCard);
    _players.add(p1);
    _players.add(p2);
    _players.add(p3);
  }

  static Config instance = new Config();

  get numPlayers => _players.length;
  get numCardsInHand => (numCards / (_players.length + 1)).floor();
  get players => _players;

  bool isValid(int newNumCards) {
    var result = newNumCards % (numPlayers + 1) == 0;
    L.log('config isValid result: $result');
    return result;
  }
}
