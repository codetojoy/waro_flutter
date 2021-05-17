import './card.dart' as waro_c;
import './player.dart';

class Table {
  Kitty _kitty;
  List<Player> _players;
  String _status = '';

  Table(this._kitty, this._players);

  Kitty get kitty => _kitty;
  void set(Kitty kitty) => _kitty = kitty;

  List<Player> get players => _players;

  waro_c.Card get prizeCard => _kitty.cards[0];

  String get status => _status;
  set status(String status) => _status = status;

  bool isGameOver() {
    return kitty.hand.cards.length == 0;
  }

  Player get user {
    var result = _players.firstWhere((p) => p.isUser);
    return result;
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
