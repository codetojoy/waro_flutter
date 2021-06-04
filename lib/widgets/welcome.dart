import 'package:flutter/material.dart';

import './util/my_media_query.dart';
import '../util/constants.dart';

class Welcome extends StatelessWidget {
  final AppBar _appBar;

  Welcome(this._appBar);

  Widget _buildLandscape(BuildContext context, MediaQueryData mediaQueryData) {
    var myMediaQuery = MyMediaQuery([0.5], context, _appBar);
    var textStyle = Theme.of(context).textTheme.headline3;
    var height1 = myMediaQuery.values[0];
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: height1, child: Text(C.TITLE_FLUTTER, style: textStyle)),
        ],
      ),
    );
  }

  Widget _buildPortrait(BuildContext context, MediaQueryData mediaQueryData) {
    var myMediaQuery = MyMediaQuery([0.5], context, _appBar);
    var textStyle = Theme.of(context).textTheme.headline3;
    var height1 = myMediaQuery.values[0];
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: height1, child: Text(C.TITLE_FLUTTER, style: textStyle)),
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
