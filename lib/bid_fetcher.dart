import './models/bid.dart';
import './models/card.dart';
import './models/players.dart';
import './models/table.dart';
import './util/logger.dart';

/*
  TODO: stuck on async for ApiStrategy
  work-in-progress
*/

class BidFetcher {
  List<Bid> findBids(Table table, Card userCard) {
    var prizeCard = table.prizeCard;
    var players = table.players;
    List<Bid> bids = [];

    List<Future<Card>> offerFutures = [];

    players.forEach((player) {
      if (!player.isUser) {
        L.log('TRACER 25-MAY cp abc $player');
        var offerFuture = player.selectCard(prizeCard);
        // offerFutures.add(offerFuture);
      } else {
        var bid = new Bid(player, userCard);
        bids.add(bid);
      }
    });

    Future.wait(offerFutures).then((List<dynamic> offers) => {
          offers.forEach((offer) {
            var card = offer as Card;
            table.updateDiscardTotal(card);
            var player = new Players().findByCard(players, card);
            L.log('TRACER 25-MAY cp def $card $player');
            player.updateHand(card);
            var bid = new Bid(player, card);
            bids.add(bid);
          })
        });

    return bids;
  }

  /*
  List<Bid> findBids(Table table, Card userCard) {
    var prizeCard = table.prizeCard;
    var bids = table.players.map((player) {
      Card offer = (player.isUser) ? userCard : player.selectCard(prizeCard);
      table.updateDiscardTotal(offer);
      player.updateHand(offer);
      return new Bid(player, offer);
    });
    return bids.toList();
  }
  */
}
