import 'package:flutter/material.dart';

import './card_widget.dart';
import '../models/card.dart' as waro_c;

class PrizeCardWidget extends StatelessWidget {
  final waro_c.Card _prizeCard;

  PrizeCardWidget(this._prizeCard);

  _noOp() {}

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(children: [
          const Text('Prize:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
          CardWidget(_prizeCard, _noOp, 'prize card'),
        ]),
        elevation: 5);
  }
}
