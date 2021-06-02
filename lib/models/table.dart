import './card.dart' as waro_c;
import './player.dart';
import './players.dart';

class Table {
  Kitty _kitty;
  final List<Player> _players;
  String status = '';
  int _discardTotal = 0;

  Table(this._kitty, this._players);

  Kitty get kitty => _kitty;
  void set(Kitty kitty) => _kitty = kitty;

  List<Player> get players => _players;

  waro_c.Card get prizeCard => _kitty.cards[0];

  int get discardTotal => _discardTotal;

  void updateDiscardTotal(waro_c.Card card) {
    _discardTotal += card.value;
  }

  bool isGameOver() {
    return kitty.hand.cards.length == 0;
  }

  Player get user {
    var result = _players.firstWhere((p) => p.isUser);
    return result;
  }

  void sortPlayers() {
    new Players().sort(_players);
  }

  String toString() {
    var result = '\n-------\n';
    result += 'kitty:\n' + _kitty.toString() + '\nplayers:\n';
    _players.forEach((p) {
      result += '$p\n';
    });
    return result;
  }
}
