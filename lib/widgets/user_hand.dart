import 'package:flutter/material.dart';

import './card.dart';
import '../models/card.dart' as waro_c;
import '../models/hand.dart';
import '../util/constants.dart';

class UserHandWidget extends StatelessWidget {
  final Hand _hand;
  final Function _playCardHandler;

  UserHandWidget(this._hand, this._playCardHandler);

  Widget _buildLandscape(BuildContext context, MediaQueryData mediaQueryData,
      List<Widget> cardWidgets) {
    final textStyle = Theme.of(context).textTheme.bodyText1;
    final heightPercentage = 0.15;
    final mediaQueryData = MediaQuery.of(context);
    final mediaHeight = mediaQueryData.size.height;
    return LayoutBuilder(builder: (ctx, constraints) {
      return new Container(
        width: constraints.maxWidth * 0.95,
        child: Card(
        child: Center(
            child: Column(children: [
          Text(C.YOUR_HAND, textAlign: TextAlign.center, style: textStyle),
          Center(child: Container(
            height: mediaHeight * heightPercentage,
            child: ListView(scrollDirection: Axis.horizontal, children: cardWidgets),
          )),
        ])),
        elevation: C.ELEVATION,
      ));
    });
  }

  Widget _buildPortrait(BuildContext context, MediaQueryData mediaQueryData,
      List<Widget> cardWidgets) {
    final textStyle = Theme.of(context).textTheme.bodyText1;
    final heightPercentage = 0.4;
    final mediaQueryData = MediaQuery.of(context);
    final mediaHeight = mediaQueryData.size.height;
    return LayoutBuilder(builder: (ctx, constraints) {
      return Card(
        child: Center(
            child: Column(children: [
          Text(C.YOUR_HAND, textAlign: TextAlign.center, style: textStyle),
          Container(
            height: mediaHeight * heightPercentage,
            child: ListView(children: cardWidgets),
          ),
        ])),
        elevation: C.ELEVATION,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> cardWidgets = _hand.cards.map<Widget>((waro_c.Card card) {
      return CardWidget(card, () => _playCardHandler(card), C.PLAY_TIP);
    }).toList();
    final mediaQueryData = MediaQuery.of(context);
    final isLandscape = mediaQueryData.orientation == Orientation.landscape;
    return (isLandscape)
        ? _buildLandscape(context, mediaQueryData, cardWidgets)
        : _buildPortrait(context, mediaQueryData, cardWidgets);
  }
}
