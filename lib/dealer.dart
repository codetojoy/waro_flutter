import './bid.dart';
import './card.dart';
import './config.dart';
import './deck.dart';
import './hand.dart';
import './logger.dart';
import './player.dart';
import './table.dart';

class Dealer {
  Table setupGame() {
    final config = new Config();
    final numCards = config.numCards;
    final numCardsInHand = config.numCardsInHand;

    final deck = new Deck(numCards);
    deck.shuffle();
    L.log(' Dealer.playGame $deck');
    var cards = deck.cards;
    var hands = dealHands(cards, numCardsInHand);
    var table = buildTable(hands, config.players);
    L.log('Dealer.pG ' + table.toString());
    return table;
  }

  Table buildTable(List<Hand> hands, List<Player> players) {
    var kittyHand = hands.removeAt(0);
    var kitty = new Kitty(kittyHand);

    assert(players.length == hands.length);
    for (var i = 0; i < players.length; i++) {
      var hand = hands[i];
      var player = players[i];
      player.hand = hand;
    }
    var table = new Table(kitty, players);
    return table;
  }

  List<Hand> dealHands(List<Card> cards, int numCardsInHand) {
    List<Hand> hands = [];

    for (var i = 0; i < cards.length; i += numCardsInHand) {
      List<Card> cardsForHand = cards.sublist(i, i + numCardsInHand);
      Hand hand = new Hand(cardsForHand);
      hands.add(hand);
    }

    return hands;
  }

  String findGameWinner(Table table) {
    Player winner = table.players[0];
    table.players.forEach((player) {
      if (player.playerStats.total > winner.playerStats.total) {
        winner = player;
      }
    });
    return winner.name + ' wins game!';
  }

  String playRound(Table table, Card userCard) {
    var prizeCard = table.prizeCard;
    List<Bid> bids = findBids(prizeCard, table.players, userCard);
    Bid winningBid = findWinningBid(bids);
    winningBid.player.winsRound(prizeCard);
    table.kitty.updateHand(prizeCard);
    L.log('Dealer.pR ' + table.toString());
    return winningBid.player.name + ' won round ($prizeCard points)';
  }

  List<Bid> findBids(Card prizeCard, List<Player> players, Card userCard) {
    var bids = players.map((player) {
      Card offer = (player.isUser) ? userCard : player.selectCard(prizeCard);
      player.updateHand(offer);
      return new Bid(player, offer);
    });
    return bids.toList();
  }

  Bid findWinningBid(List<Bid> bids) {
    Bid result = bids[0];
    bids.forEach((bid) {
      if (bid.offer.value > result.offer.value) {
        result = bid;
      }
    });
    return result;
  }
}
