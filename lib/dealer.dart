import './auditor.dart';
import './models/bid.dart';
import './models/card.dart';
import './models/config.dart';
import './models/deck.dart';
import './models/hand.dart';
import './models/player.dart';
import './models/players.dart';
import './models/table.dart';
import './util/logger.dart';

class Dealer {
  final _config = Config.instance;

  Auditor buildAuditor() {
    final numCards = _config.numCards;
    return new Auditor(numCards);
  }

  Table setupGame() {
    final numCards = _config.numCards;
    final numCardsInHand = _config.numCardsInHand;

    final deck = new Deck(numCards);
    deck.shuffle();
    L.log(' Dealer.playGame $deck');
    var cards = deck.cards;
    var hands = dealHands(cards, numCardsInHand);
    var table = buildTable(hands, _config.players);
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
    Player winner = new Players().findByHighestTotal(table.players);
    return winner.name + ' won the game!';
  }

  String playRound(Table table, Card userCard) {
    var prizeCard = table.prizeCard;
    List<Bid> bids = findBids(table, userCard);
    Bid winningBid = findWinningBid(bids);
    winningBid.player.winsRound(prizeCard);
    table.kitty.updateHand(prizeCard);
    L.log('Dealer.pR ' + table.toString());
    return winningBid.player.name + ' won round ($prizeCard points)';
  }

/*
  TODO: stuck on async for ApiStrategy
  List<Bid> findBids2(Table table, Card userCard) {
    return new BidFetcher().findBids(table, userCard);
  }
  */

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

  Bid findWinningBid(List<Bid> bids) {
    return bids.reduce((acc, bid) {
      return (bid.offer.value > acc.offer.value) ? bid : acc;
    });
  }
}
