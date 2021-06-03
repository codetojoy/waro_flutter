import 'package:flutter/material.dart';

import './double_auditor.dart';

class MyMediaQuery {
  List<double> values = [];
  List<double> _percentages = [];
  var availableHeight;
  var totalHeight;
  var totalWidth;

  final auditor = new DoubleAuditor();

  MyMediaQuery(List<double> percentages, BuildContext context, AppBar appBar) {
    MyMediaQuery.simple(context, appBar);

    _percentages = percentages;
    values = _percentages.map((percentage) {
      return availableHeight * percentage;
    }).toList();
  }

  MyMediaQuery.simple(BuildContext context, AppBar appBar) {
    var mediaQuery = MediaQuery.of(context);
    totalHeight = mediaQuery.size.height;
    totalWidth = mediaQuery.size.width;
    final appBarHeight = appBar.preferredSize.height;
    final topPaddingHeight = mediaQuery.padding.top;
    availableHeight = totalHeight - (appBarHeight + topPaddingHeight);
  }

  bool audit() {
    return auditPercentages() && auditValues();
  }

  bool auditPercentages() {
    return auditor.auditPercentages(_percentages);
  }

  bool auditValues() {
    return auditor.auditValues(values, availableHeight);
  }
}
