import './table.dart' as waro_t;

class Auditor {
  final _maxCard;
  int _expectedSum;

  Auditor(this._maxCard) {
    _expectedSum = ((_maxCard * (_maxCard + 1)) / 2).floor();
  }

  void audit(waro_t.Table table) {
    var actualSum = table.discardTotal;

    if (!table.isGameOver()) {
      actualSum += table.kitty.getSumPoints();
    }

    table.players.forEach((player) {
      actualSum += player.getSumPoints();
      actualSum += player.playerStats.total;
    });

    if (actualSum != _expectedSum) {
      throw new Exception('audit error! a: $actualSum e: $_expectedSum');
    }
  }
}
