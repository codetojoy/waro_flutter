import 'package:flutter/material.dart';

import './players_info.dart';
import './prize_card.dart';
import './status.dart';
import './user_hand.dart';
import '../models/table.dart' as waro_t;

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
        ],
      ));
    }
  }
}
