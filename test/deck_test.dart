import 'package:test/test.dart';
import 'package:waro_flutter/card.dart';
import 'package:waro_flutter/cards.dart';
import 'package:waro_flutter/deck.dart';

void main() {
  test('deck basic', () {
    final numCards = 20;

    // test
    final deck = Deck(numCards);

    expect(deck.cards.first.value, 1);
    expect(deck.cards.last.value, numCards);
  });

  test('deck shuffle should have same sum', () {
    final numCards = 20;
    final deck = Deck(numCards);
    List<Card> originalCards = []..addAll(deck.cards);
    var originalTotal = new Cards().sum(originalCards);

    // test
    deck.shuffle();

    var shuffleTotal = new Cards().sum(deck.cards);

    expect(shuffleTotal, originalTotal);
  });

  test('deck shuffle should have less than N matches with original order', () {
    final numCards = 20;
    final deck = Deck(numCards);
    var originalCards = []..addAll(deck.cards);

    // test
    deck.shuffle();

    var numMatches = 0;
    final numMatchesThreshold = 10;

    for (var i = 0; i < originalCards.length; i++) {
      var originalValue = originalCards[i].value;
      var newValue = deck.cards[i].value;
      if (originalValue == newValue) {
        numMatches++;
      }
    }

    var check = (numMatches < numMatchesThreshold);
    expect(check, true);
  });
}
