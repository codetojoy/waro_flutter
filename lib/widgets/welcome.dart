import 'package:flutter/material.dart';

import './util/my_media_query.dart';
import '../util/constants.dart';

class Welcome extends StatelessWidget {
  final AppBar _appBar;
  final Function _newGameHandler;

  Welcome(this._appBar, this._newGameHandler);

  Widget _buildLandscape(BuildContext context, MediaQueryData mediaQueryData) {
    var myMediaQuery = MyMediaQuery([0.5, 0.4], context, _appBar);
    var textStyle = Theme.of(context).textTheme.headline3;
    var height1 = myMediaQuery.values[0];
    var height2 = myMediaQuery.values[1];
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: height1, child: Text(C.TITLE_FLUTTER, style: textStyle)),
          Container(
              height: height2,
              child: FloatingActionButton(
                  onPressed: _newGameHandler,
                  tooltip: C.NEW_GAME,
                  child: Icon(Icons.add))),
        ],
      ),
    );
  }

  Widget _buildPortrait(BuildContext context, MediaQueryData mediaQueryData) {
    var myMediaQuery = MyMediaQuery([0.5, 0.3], context, _appBar);
    var textStyle = Theme.of(context).textTheme.headline3;
    var height1 = myMediaQuery.values[0];
    var height2 = myMediaQuery.values[1];
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: height1, child: Text(C.TITLE_FLUTTER, style: textStyle)),
          Container(
              height: height2,
              child: FloatingActionButton(
                  onPressed: _newGameHandler,
                  tooltip: C.NEW_GAME,
                  child: Icon(Icons.add))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    var isLandscape = mediaQueryData.orientation == Orientation.landscape;
    // TODO: consider consolidating the 2 build methods, re: duplication
    return (isLandscape)
        ? _buildLandscape(context, mediaQueryData)
        : _buildPortrait(context, mediaQueryData);
  }
}
