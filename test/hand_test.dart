import 'package:test/test.dart';
import 'package:waro_flutter/models/deck.dart';
import 'package:waro_flutter/models/hand.dart';
import 'package:waro_flutter/util/constants.dart';

void main() {
  final numCards = 3;
  final deck = Deck(numCards);

  setUp(() {
      // 1,3,2
    final tmp = deck.cards[2];
    deck.cards[2] = deck.cards[1];
    deck.cards[1] = tmp;
  });

  test('sort none', () {
    // 1,3,2
    final hand = new Hand(deck.cards);

    // test
    hand.sort(C.SORT_NONE);

    var index = 0;
    expect(hand.cards[index++].value, 1);
    expect(hand.cards[index++].value, 3);
    expect(hand.cards[index++].value, 2);
  });
  test('sort ascending', () {
    // 1,3,2
    final hand = new Hand(deck.cards);

    // test
    hand.sort(C.SORT_ASC);

    var index = 0;
    expect(hand.cards[index++].value, 1);
    expect(hand.cards[index++].value, 2);
    expect(hand.cards[index++].value, 3);
  });
  test('sort descending', () {
    // 1,3,2
    final hand = new Hand(deck.cards);

    // test
    hand.sort(C.SORT_DESC);

    var index = 0;
    expect(hand.cards[index++].value, 3);
    expect(hand.cards[index++].value, 2);
    expect(hand.cards[index++].value, 1);
  });
}
