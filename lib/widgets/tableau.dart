import 'package:flutter/material.dart';

import './card_widget.dart';
import './players_info_widget.dart';
import '../models/card.dart' as waro_c;
import '../models/hand.dart';
import '../models/table.dart' as waro_t;

class Tableau extends StatelessWidget {
  final waro_t.Table _table;
  final Function _playCardHandler;
  final Function _newGameHandler;
  final Function _cancelGameHandler;

  Tableau(this._table, this._playCardHandler, this._newGameHandler,
      this._cancelGameHandler);

  @override
  Widget build(BuildContext context) {
    if (this._table.isGameOver()) {
      return Container(
          width: double.infinity,
          child: Column(
            children: [
              _StatusWidget(_table.status),
              PlayersInfoWidget(_table.players),
              FloatingActionButton(
                onPressed: _newGameHandler,
                tooltip: 'New Game',
                child: Icon(Icons.add),
              ),
            ],
          ));
    } else {
      return Center(
          child: Column(
        children: [
          _StatusWidget(_table.status),
          _PrizeCardWidget(_table.prizeCard),
          _UserHandWidget(_table.user.hand, _playCardHandler),
          PlayersInfoWidget(_table.players),
          FloatingActionButton(
            onPressed: _cancelGameHandler,
            tooltip: 'Quit Game',
            child: Icon(Icons.cancel),
          ),
        ],
      ));
    }
  }
}

class _StatusWidget extends StatelessWidget {
  final String _statusText;

  _StatusWidget(this._statusText);

  @override
  Widget build(BuildContext context) {
    var mediaWidth = MediaQuery.of(context).size.width;
    return Card(
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: mediaWidth * 0.3, vertical: 10),
            child: Text(this._statusText,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        elevation: 5);
  }
}

class _PrizeCardWidget extends StatelessWidget {
  final waro_c.Card _prizeCard;

  _PrizeCardWidget(this._prizeCard);

  _noOp() {}

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(children: [
          Text('Prize:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
          CardWidget(_prizeCard, _noOp, 'prize card'),
        ]),
        elevation: 5);
  }
}

class _UserHandWidget extends StatelessWidget {
  final Hand _hand;
  final Function _playCardHandler;

  _UserHandWidget(this._hand, this._playCardHandler);

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

