import 'package:test/test.dart';
import 'package:waro_flutter/models/card.dart';
import 'package:waro_flutter/models/player.dart';
import 'package:waro_flutter/models/players.dart';

void main() {
  test('findByHighestTotal basic', () {
    var p1 = new Player.simple('Bach');
    p1.winsRound(new Card(5));
    var p2 = new Player.simple('Mozart');
    p2.winsRound(new Card(9));
    var p3 = new Player.simple('Chopin');
    p3.winsRound(new Card(7));

    List<Player> players = [p1, p2, p3];

    // test
    var result = new Players().findByHighestTotal(players);

    expect("Mozart", result.name);
  });
}
