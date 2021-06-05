import 'package:flutter/material.dart';

import './card.dart';
import '../models/card.dart' as waro_c;
import '../models/hand.dart';

class UserHandWidget extends StatelessWidget {
  final Hand _hand;
  final Function _playCardHandler;

  UserHandWidget(this._hand, this._playCardHandler);

  Widget _buildLandscape(
      MediaQueryData mediaQueryData, List<Widget> cardWidgets) {
    return Center(
      child: Column(children: [
        const Text('Your hand:',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
        Container(
          height: 300,
          width: 100,
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: cardWidgets)),
        ),
      ]),
    );
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
          Text('Your hand:', textAlign: TextAlign.center, style: textStyle),
          Container(
            height: mediaHeight * heightPercentage,
            child: ListView(children: cardWidgets),
          ),
        ])),
        elevation: 5,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> cardWidgets = _hand.cards.map<Widget>((waro_c.Card card) {
      return CardWidget(card, () => _playCardHandler(card), 'press to play');
    }).toList();
    var mediaQueryData = MediaQuery.of(context);
    var isLandscape = mediaQueryData.orientation == Orientation.landscape;
    return (isLandscape)
        ? _buildLandscape(mediaQueryData, cardWidgets)
        : _buildPortrait(context, mediaQueryData, cardWidgets);
  }
}
