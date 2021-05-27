import 'package:test/test.dart';
import 'package:waro_flutter/dealer.dart';
import 'package:waro_flutter/models/bid.dart';
import 'package:waro_flutter/models/card.dart';
import 'package:waro_flutter/models/player.dart';

void main() {
  test('findWinningBid basic', () {
    var p1 = new Player.simple('Bach');
    var p2 = new Player.simple('Mozart');
    var p3 = new Player.simple('Chopin');
    var b1 = new Bid(p1, new Card(4));
    var b2 = new Bid(p2, new Card(8));
    var b3 = new Bid(p3, new Card(6));
    List<Bid> bids = [b1, b2, b3];

    // test
    var result = new Dealer().findWinningBid(bids);

    expect("Mozart", result.player.name);
  });
}
