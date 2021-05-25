import './card.dart';
import './player.dart';

class Players {
  void sort(List<Player> players) {
    players.sort((a, b) => b.playerStats.total.compareTo(a.playerStats.total));
  }

  void newGame(List<Player> players) {
    players.forEach((player) {
      player.newGame();
    });
  }

  Player findByCard(List<Player> players, Card card) {
    var result;
    var found = false;
    players.forEach((player) {
      if (!found && !player.isUser) {
        found = player.hand.contains(card);
        if (found) {
          result = player;
        }
      }
    });
    return result;
  }

  Player findByHighestTotal(List<Player> players) {
    var result = players[0];
    players.forEach((player) {
      if (player.playerStats.total > result.playerStats.total) {
        result = player;
      }
    });
    return result;
  }
}
