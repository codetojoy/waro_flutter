import './player.dart';

class Players {
  void sort(List<Player> players) {
    players.sort((a, b) => b.playerStats.total.compareTo(a.playerStats.total));
  }
}
