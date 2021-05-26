import 'package:test/test.dart';
import 'package:waro_flutter/models/card.dart';
import 'package:waro_flutter/models/cards.dart';
import 'package:waro_flutter/models/deck.dart';
import 'package:waro_flutter/models/hand.dart';

void main() {
  test('sum basic', () {
    final numCards = 50;
    final deck = new Deck(numCards);
    final hand = new Hand(deck.cards);

    // test
    var result = new Cards().sum(hand.cards);

    var expected = (numCards * (numCards + 1)) / 2;
    expect(expected, result);
  });
}
