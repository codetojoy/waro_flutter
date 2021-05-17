import './player.dart';
import './strategy.dart';

class Config {
  final int _numCards = 20;
  int _numPlayers;
  int _numCardsInHand;
  final List<Player> _players = [];

  Config() {
    var maxCard = _numCards;
    var nextCard = new Strategies().buildStrategy('next');
    var p1 = new Player('You', nextCard, true, maxCard);
    var p2 = new Player('Mozart', nextCard, false, maxCard);
    var p3 = new Player('Chopin', nextCard, false, maxCard);
    _players.add(p1);
    _players.add(p2);
    _players.add(p3);
    _numPlayers = _players.length;
    _numCardsInHand = (_numCards / (_numPlayers + 1)).floor();
  }

  get numCards => _numCards;
  get numPlayers => _numPlayers;
  get numCardsInHand => _numCardsInHand;
  get players => _players;
}
