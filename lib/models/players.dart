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

  // this is part of the WIP api strategy
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
    return players.reduce((acc, player) {
      return (player.playerStats.total > acc.playerStats.total) ? player : acc;
    });
  }
}
