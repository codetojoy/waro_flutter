import 'package:test/test.dart';
import 'package:waro_flutter/models/card.dart';
import 'package:waro_flutter/models/strategy.dart';

void main() {
  const maxCard = 12;
  const prizeCard = 7;
  List<Card> cards = [];
  Strategy strategy;

  setUp(() {
    // 10, 1, 4, 8
    cards.add(new Card(4));
    cards.add(new Card(10));
    cards.add(new Card(1));
    cards.add(new Card(8));
  });

  test('next card', () {
    strategy = new Strategies().buildStrategy(StrategyType.next_card);

    // test
    var result = strategy.selectCard(cards, prizeCard, maxCard);

    expect(result.value, 4);
  });
  test('max card', () {
    strategy = new Strategies().buildStrategy(StrategyType.max_card);

    // test
    var result = strategy.selectCard(cards, prizeCard, maxCard);

    expect(result.value, 10);
  });
  test('min card', () {
    strategy = new Strategies().buildStrategy(StrategyType.min_card);

    // test
    var result = strategy.selectCard(cards, prizeCard, maxCard);

    expect(result.value, 1);
  });
}
