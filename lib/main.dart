import 'package:flutter/material.dart';

import './home_page.dart';
import './models/card.dart' as waro_c;
import './models/config.dart';
import './models/game.dart';
import './util/constants.dart';
import './util/logger.dart';
import './widgets/about.dart';
import './widgets/config_form.dart';
import './widgets/tableau.dart';
import './widgets/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: C.TITLE,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          secondaryHeaderColor: Colors.black,
        ),
        // home: MyHomePage(title: C.TITLE));
        initialRoute: MyHomePage.rootRoute,
        routes: {
          MyHomePage.rootRoute: (ctx) => MyHomePage(title: C.TITLE),
          ConfigForm.routeName: (ctx) => ConfigForm(),
          About.routeName: (ctx) => About(),
        });
  }
}
