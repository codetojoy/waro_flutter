import './card.dart';
import './players.dart';
import './table.dart';
import '../auditor.dart';
import '../dealer.dart';

class Game {
  Dealer _dealer = new Dealer();
  Table _table;
  bool _inProgress = false;
  Auditor _auditor;

  Table get table => _table;
  bool get inProgress => _inProgress;

  void setupGame() {
    _inProgress = true;
    _table = _dealer.setupGame();
    _table.status = "Your turn";
    _auditor = _dealer.buildAuditor();
    new Players().newGame(_table.players);
  }

  void cancel() {
    _inProgress = false;
  }

  void playRound(Card userCard) {
    String status = _dealer.playRound(_table, userCard);
    _table.sortPlayers();
    _auditor.audit(_table);
    _table.status = status;
  }

  bool isGameOver() => _table.isGameOver();

  void findGameWinner() {
    _table.status = _dealer.findGameWinner(_table);
  }
}
