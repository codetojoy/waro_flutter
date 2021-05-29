import 'package:test/test.dart';
import 'package:waro_flutter/models/card.dart';
import 'package:waro_flutter/models/deck.dart';
import 'package:waro_flutter/models/hand.dart';
import 'package:waro_flutter/util/constants.dart';

void main() {
  final numCards = 3;
  Deck deck;
  int testCount = 1;
  Hand hand;

  group('Hand', () {
    setUp(() {
      print('TRACER Hand setup # ${testCount++}');
      // 1,3,2
      deck = Deck(numCards);
      final tmp = deck.cards[2];
      deck.cards[2] = deck.cards[1];
      deck.cards[1] = tmp;

      var index = 0;
      expect(deck.cards[index++].value, 1);
      expect(deck.cards[index++].value, 3);
      expect(deck.cards[index++].value, 2);

      hand = new Hand(deck.cards);

      final expectedValues = hand.cards.map((c) => c.value);
      expect(expectedValues, [1, 3, 2]);
    });

    test('update hand basic', () {
      // 1,3,2

      // test
      final result = hand.updateHand(new Card(1));

      final expectedValues = hand.cards.map((c) => c.value);
      expect(expectedValues, [3, 2]);
    });
    test('sort none', () {
      // 1,3,2

      // test
      hand.sort(C.SORT_NONE);

      final expectedValues = hand.cards.map((c) => c.value);
      expect(expectedValues, [1, 3, 2]);
    });
    test('sort ascending', () {
      // 1,3,2

      // test
      hand.sort(C.SORT_ASC);

      final expectedValues = hand.cards.map((c) => c.value);
      expect(expectedValues, [1, 2, 3]);
    });
    test('sort descending', () {
      // 1,3,2

      // test
      hand.sort(C.SORT_DESC);

      final expectedValues = hand.cards.map((c) => c.value);
      expect(expectedValues, [3, 2, 1]);
    });
    test('contains basic green', () {
      // 1,3,2

      // test
      var result = hand.contains(new Card(2));

      expect(result, true);
    });
    test('contains basic red', () {
      // 1,3,2

      // test
      var result = hand.contains(new Card(7));

      expect(result, false);
    });

    // end group
  });
}
