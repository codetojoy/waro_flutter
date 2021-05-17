import './card.dart';
import './dealer.dart';
import './table.dart';

class Game {
  Dealer _dealer = new Dealer();
  Table _table;
  bool _inProgress = false;

  Table get table => _table;
  bool get inProgress => _inProgress;

  void setupGame() {
    _inProgress = true;
    _table = _dealer.setupGame();
    _table.status = "Your turn";
  }

  void playRound(Card userCard) {
    String status = _dealer.playRound(_table, userCard);
    _table.status = status;
  }

  bool isGameOver() => _table.isGameOver();

  void findGameWinner() {
    _dealer.findGameWinner(_table);
  }
}
