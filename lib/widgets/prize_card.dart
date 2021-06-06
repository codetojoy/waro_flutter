import 'package:flutter/material.dart';

import './card.dart';
import '../models/card.dart' as waro_c;
import '../util/constants.dart';

class PrizeCardWidget extends StatelessWidget {
  final waro_c.Card _prizeCard;

  PrizeCardWidget(this._prizeCard);

  _noOp() {}

  Widget _buildLandscape(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText1;
    final mediaQueryData = MediaQuery.of(context);
    final mediaWidth = mediaQueryData.size.width;
    final kludge = 25;
    return Container(
        width: kludge + (mediaWidth * C.WIDTH_PERCENTAGE),
        padding: EdgeInsets.all(C.PADDING),
        child: Card(
            child: Row(children: [
              Text(C.PRIZE, textAlign: TextAlign.center, style: textStyle),
              CardWidget(_prizeCard, _noOp, C.PRIZE_TIP),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,),
            elevation: C.ELEVATION));
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
              Text(C.PRIZE, textAlign: TextAlign.center, style: textStyle),
              CardWidget(_prizeCard, _noOp, C.PRIZE_TIP),
            ])),
        elevation: 5);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final isLandscape = mediaQueryData.orientation == Orientation.landscape;
    return (isLandscape) ? _buildLandscape(context) : _buildPortrait(context);
  }
}
