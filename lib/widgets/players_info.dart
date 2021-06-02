import 'package:flutter/material.dart';

import '../models/player.dart';

class PlayersInfoWidget extends StatelessWidget {
  final List<Player> _players;

  PlayersInfoWidget(this._players);

  @override
  Widget build(BuildContext context) {
    var infoWidgets = _players.map((player) {
      return PlayerInfoWidget(player);
    });
    return Container(
        child: Card(
          child: Column(
            children: [
              ...infoWidgets,
            ],
          ),
          elevation: 5,
        ),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40));
  }
}

class PlayerInfoWidget extends StatelessWidget {
  final Player _player;

  PlayerInfoWidget(this._player);

  @override
  Widget build(BuildContext context) {
    var text = _player.name + ' : ' + _player.playerStats.toString();
    return Column(
      children: [
        Text(text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
