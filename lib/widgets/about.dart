import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:waro_flutter/widgets/util/my_media_query.dart';

class About extends StatelessWidget {
  final AppBar _appBar;

  About(this._appBar);

  String _version() {
    var version = "v1";
    // TODO: this should be a compile-time stamp, based on build
    var now = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    return '$version $now';
  }

  @override
  Widget build(BuildContext context) {
    var isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    var orientation = (isLandscape) ? 'landscape' : 'portrait';
    var myMediaQuery = MyMediaQuery.simple(context, _appBar);
    var availableHeight = myMediaQuery.availableHeight;
    var totalHeight = myMediaQuery.totalHeight;
    var totalWidth = myMediaQuery.totalWidth;
    var textStyle = Theme.of(context).textTheme.headline5;
    return Card(
        child: Center(
            child: Column(children: [
          Text('version: ${_version()}', style: textStyle),
          Text('orientation: ${orientation}', style: textStyle),
          Text('total height: ${totalHeight}', style: textStyle),
          Text('available height: ${availableHeight}', style: textStyle),
          Text('total width: ${totalWidth}', style: textStyle),
        ])),
        elevation: 10);
  }
}
