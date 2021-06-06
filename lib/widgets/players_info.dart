import 'package:flutter/material.dart';
import 'package:sprintf/sprintf.dart';

import '../models/player.dart';
import '../util/constants.dart';


class PlayersInfoWidget extends StatelessWidget {
  final List<Player> _players;

  PlayersInfoWidget(this._players);

  Widget _buildLandscape(BuildContext context, List<Widget> infoWidgets) {
    final mediaQueryData = MediaQuery.of(context);
    final mediaWidth = mediaQueryData.size.width;
    return Card(
        child: Container(
            padding: EdgeInsets.all(10),
            width: mediaWidth * 0.95,
            child: Column(children: infoWidgets)),
        elevation: 5);
  }

  Widget _buildPortrait(BuildContext context, List<Widget> infoWidgets) {
    final mediaQueryData = MediaQuery.of(context);
    final mediaWidth = mediaQueryData.size.width;
    return Card(
        child: Container(
            padding: EdgeInsets.all(C.PADDING),
            width: mediaWidth * C.WIDTH_PERCENTAGE,
            child: Column(children: infoWidgets)),
        elevation: C.ELEVATION);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final isLandscape = mediaQueryData.orientation == Orientation.landscape;
    final infoWidgets = _players.map((player) {
      return PlayerInfoWidget(player);
    }).toList();
    return (isLandscape)
        ? _buildLandscape(context, infoWidgets)
        : _buildPortrait(context, infoWidgets);
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
    final mediaQueryData = MediaQuery.of(context);
    final mediaWidth = mediaQueryData.size.width;
    final mediaHeight = mediaQueryData.size.height;
    final text =
        sprintf("%s : %s", [_player.name, _player.playerStats.toString()]);
    return Container(
      padding: EdgeInsets.all(1),
      width: mediaWidth * 0.95,
      // height: mediaWidth * 0.1,
      child: Text(text, textAlign: TextAlign.center, style: textStyle),
    );
  }
}
