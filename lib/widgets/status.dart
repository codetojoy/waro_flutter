import 'package:flutter/material.dart';

class StatusWidget extends StatelessWidget {
  final String _statusText;

  StatusWidget(this._statusText);

  @override
  Widget build(BuildContext context) {
    var mediaWidth = MediaQuery.of(context).size.width;
    return Card(
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: mediaWidth * 0.3, vertical: 10),
            child: Text(this._statusText,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        elevation: 5);
  }
}
