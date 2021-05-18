import 'package:flutter/material.dart';

import './card.dart' as waro_c;
import './hand.dart';
import './player.dart';
import './table.dart' as waro_t;

class Tableau extends StatelessWidget {
  final waro_t.Table _table;
  final Function _playCardHandler;
  final Function _newGameHandler;

  Tableau(this._table, this._playCardHandler, this._newGameHandler);

  @override
  Widget build(BuildContext context) {
    if (this._table.isGameOver()) {
      return Container(
          width: double.infinity,
          child: Column(
            children: [
              _StatusWidget(_table.status),
              _PlayersInfoWidget(_table.players),
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
          _PlayersInfoWidget(_table.players),
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
    return Text(this._statusText,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold));
  }
}

class _PrizeCardWidget extends StatelessWidget {
  final waro_c.Card _prizeCard;

  _PrizeCardWidget(this._prizeCard);

  _noOp() {}

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      Text('Prize:',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
      _CardWidget(_prizeCard, _noOp, 'prize card'),
    ]));
  }
}

/*
class _KittyWidget extends StatelessWidget {
  final Kitty _kitty;

  _KittyWidget(this._kitty);

  _noOp() {}

  @override
  Widget build(BuildContext context) {
    var cardWidgets = _kitty.cards.map((waro_c.Card card) {
      return _CardWidget(card, _noOp, '');
    });
    return Center(
        child: Row(
      children: [
        ...cardWidgets,
      ],
    ));
  }
}
*/

class _UserHandWidget extends StatelessWidget {
  final Hand _hand;
  final Function _playCardHandler;

  _UserHandWidget(this._hand, this._playCardHandler);

  @override
  Widget build(BuildContext context) {
    var cardWidgets = _hand.cards.map((waro_c.Card card) {
      return _CardWidget(card, () => _playCardHandler(card), 'press to play');
    });
    return Center(
        child: Column(
      children: [
        Text('Your hand:',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
        ...cardWidgets,
      ],
    ));
  }
}

class _PlayersInfoWidget extends StatelessWidget {
  final List<Player> _players;

  _PlayersInfoWidget(this._players);

  @override
  Widget build(BuildContext context) {
    var infoWidgets = _players.map((player) {
      return _PlayerInfoWidget(player);
    });
    return Center(
        child: Column(
      children: [
        ...infoWidgets,
      ],
    ));
  }
}

class _PlayerInfoWidget extends StatelessWidget {
  final Player _player;

  _PlayerInfoWidget(this._player);

  @override
  Widget build(BuildContext context) {
    var text = _player.name + ' : ' + _player.playerStats.toString();
    return Center(
        child: Column(
      children: [
        Text(text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      ],
    ));
  }
}

class _CardWidget extends StatelessWidget {
  final waro_c.Card _card;
  final Function _selectHandler;
  final String _tooltip;

  _CardWidget(this._card, this._selectHandler, this._tooltip);

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
