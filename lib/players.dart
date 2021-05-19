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
