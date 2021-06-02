import 'package:flutter/material.dart';

import './card_widget.dart';
import '../models/card.dart' as waro_c;
import '../models/hand.dart';

class UserHandWidget extends StatelessWidget {
  final Hand _hand;
  final Function _playCardHandler;

  UserHandWidget(this._hand, this._playCardHandler);

  @override
  Widget build(BuildContext context) {
    var cardWidgets = _hand.cards.map((waro_c.Card card) {
      return CardWidget(card, () => _playCardHandler(card), 'press to play');
    });
    return Center(
      child: Column(children: [
        const Text('Your hand:',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
        Container(
          height: 300,
          child: ListView(children: [
            ...cardWidgets,
          ]),
        ),
      ]),
    );
  }
}