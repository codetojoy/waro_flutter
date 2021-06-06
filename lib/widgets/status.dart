import 'package:flutter/material.dart';

import '../util/constants.dart';

class StatusWidget extends StatelessWidget {
  final String _statusText;

  StatusWidget(this._statusText);

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    var mediaWidth = mediaQueryData.size.width;
    var textStyle = Theme.of(context).textTheme.bodyText1;

    return Card(
      child: Container(
        padding: EdgeInsets.all(C.PADDING),
        width: mediaWidth * C.WIDTH_PERCENTAGE,
        child: Text(_statusText, textAlign: TextAlign.center, style: textStyle),
      ),
      elevation: C.ELEVATION,
    );
  }
}
