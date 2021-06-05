import 'package:flutter/material.dart';

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
        padding: EdgeInsets.all(10),
        width: mediaWidth * 0.95,
        child: Text(_statusText, textAlign: TextAlign.center, style: textStyle),
      ),
      elevation: 5,
    );
  }
}
