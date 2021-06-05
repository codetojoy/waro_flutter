import 'package:flutter/material.dart';

import './card.dart';
import '../models/card.dart' as waro_c;

class PrizeCardWidget extends StatelessWidget {
  final waro_c.Card _prizeCard;

  PrizeCardWidget(this._prizeCard);

  _noOp() {}

  Widget _buildLandscape(BuildContext context) {
    var textStyle = Theme.of(context).textTheme.bodyText1;
    return Card(
        child: Center(
            child: Row(children: [
          Text('Prize:', textAlign: TextAlign.center, style: textStyle),
          CardWidget(_prizeCard, _noOp, 'prize card'),
        ])),
        elevation: 5);
  }

  Widget _buildPortrait(BuildContext context) {
    var textStyle = Theme.of(context).textTheme.bodyText1;
    var mediaQueryData = MediaQuery.of(context);
    var mediaWidth = mediaQueryData.size.width;
    return Card(
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: mediaWidth * 0.4, vertical: 10),
            child: Column(children: [
              Text('Prize:', textAlign: TextAlign.center, style: textStyle),
              CardWidget(_prizeCard, _noOp, 'prize card'),
            ])),
        elevation: 5);
  }

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    var isLandscape = mediaQueryData.orientation == Orientation.landscape;
    return (isLandscape) ? _buildLandscape(context) : _buildPortrait(context);
  }
}
