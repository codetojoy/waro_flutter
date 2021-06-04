import 'package:flutter/material.dart';
import 'package:sprintf/sprintf.dart';

import '../models/player.dart';

class PlayersInfoWidget extends StatelessWidget {
  final List<Player> _players;

  PlayersInfoWidget(this._players);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final mediaWidth = mediaQueryData.size.width;
    var infoWidgets = _players.map((player) {
      return PlayerInfoWidget(player);
    }).toList();
    return Card(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: mediaWidth * 0.4, vertical: 10),
            child: Column(
                children: infoWidgets,
                )),
        elevation: 5);
    /*
    return Container(
        child: Card(
          child: Column(
            children: [
              ...infoWidgets,
            ],
          ),
          elevation: 15,
        ),
        padding:
            EdgeInsets.symmetric(horizontal: mediaWidth * 0.3, vertical: 10));
            */
  }
}

class PlayerInfoWidget extends StatelessWidget {
  final Player _player;

  PlayerInfoWidget(this._player);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText1;
    // final text = _player.name + ' : ' + _player.playerStats.toString();
    // final text = sprintf("%-10s : %-7s", [_player.name, _player.playerStats.toString()]);
    final text = sprintf("%s : %s", [_player.name, _player.playerStats.toString()]);
    return Container(child: Column(
      children: [
        Container(width: 180, child: Text(text, textAlign: TextAlign.center, style: textStyle)),
      ],
    ));
  }
}
