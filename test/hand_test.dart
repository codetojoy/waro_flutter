import 'package:test/test.dart';
import 'package:waro_flutter/models/deck.dart';
import 'package:waro_flutter/models/hand.dart';

void main() {
  test('sort basic', () {
    final numCards = 20;
    final deck = Deck(numCards);
    final hand = new Hand(deck.cards);

    // test
    hand.sort();

    expect(hand.cards.first.value, 1);
    expect(hand.cards.last.value, numCards);
  });
}
