import 'package:test/test.dart';
import 'package:waro_flutter/deck.dart';

void main() {
  test('deck basic', () {
    final numCards = 20;

    // test
    final deck = Deck(numCards);

    expect(deck.cards.first.value, 1);
    expect(deck.cards.last.value, numCards);
  });
}
