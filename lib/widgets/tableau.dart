import 'package:flutter/material.dart';

import './players_info_widget.dart';
import './prize_card_widget.dart';
import './status.dart';
import './user_hand_widget.dart';
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
              StatusWidget(_table.status),
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
          StatusWidget(_table.status),
          PrizeCardWidget(_table.prizeCard),
          UserHandWidget(_table.user.hand, _playCardHandler),
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
