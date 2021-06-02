import 'package:flutter/material.dart';

import '../models/card.dart' as waro_c;

class CardWidget extends StatelessWidget {
  final waro_c.Card _card;
  final Function _selectHandler;
  final String _tooltip;

  CardWidget(this._card, this._selectHandler, this._tooltip);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _selectHandler,
      tooltip: _tooltip,
      child: Text(_card.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
    );
  }
}
