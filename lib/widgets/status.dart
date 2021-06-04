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
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(this._statusText,
                textAlign: TextAlign.center,
                style: textStyle))),
        elevation: 5);
  }
}
