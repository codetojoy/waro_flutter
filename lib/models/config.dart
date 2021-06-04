import './player.dart';
import './strategy.dart';
import '../util/constants.dart';
import '../util/logger.dart';

class Config {
  int numCards = 28;
  List<Player> _players = [];
  // TODO: enum
  String sortOrder = C.SORT_NONE;

  Config._() {
    var nextCard = new Strategies().buildStrategy(StrategyType.next_card);
    var p1 = new Player('You', nextCard, true, this);
    var p2 = new Player('Mozart', nextCard, false, this);
    var p3 = new Player('Chopin', nextCard, false, this);
    _players.add(p1);
    _players.add(p2);
    _players.add(p3);
  }

  static Config instance = new Config._();

  get numPlayers => _players.length;
  get numCardsInHand => (numCards / (_players.length + 1)).floor();
  get players => _players;

  bool isValid(int newNumCards) {
    var result = newNumCards % (numPlayers + 1) == 0;
    L.log('config isValid result: $result');
    return result;
  }

  String toString() {
    return 'config :: numCards: ${numCards} sortOrder: ${sortOrder}';
  }
}
