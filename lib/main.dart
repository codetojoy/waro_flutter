import 'package:flutter/material.dart';

import './models/card.dart' as waro_c;
import './models/config.dart';
import './models/game.dart';
import './util/logger.dart';
import './util/time.dart';
import './widgets/config_form.dart';
import './widgets/tableau.dart';
import './widgets/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String _version() {
    var version = "23-MAY-2021-tragically-hip";
    var now = new Time().now();
    return 'waro v $version $now';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _version(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        secondaryHeaderColor: Colors.black,
      ),
      home: MyHomePage(title: _version()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Game _game;

  void _newGame() {
    setState(() {
      _game = new Game();
      _game.setupGame();
    });
  }

  bool _isGameInProgress() {
    bool result = (_game != null) && _game.inProgress;
    return result;
  }

  void _playCard(waro_c.Card card) {
    setState(() {
      L.log('user played card: $card');
      _game.playRound(card);
      if (_game.isGameOver()) {
        L.log('main game over');
        _game.findGameWinner();
      }
    });
  }

  void _pushConfig() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Config'),
            ),
            body: ConfigForm(Config.instance),
          );
        }, // ...to here.
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(icon: Icon(Icons.list), onPressed: _pushConfig),
          ],
        ),
        body: (_isGameInProgress())
            ? Tableau(_game.table, _playCard, _newGame)
            : Welcome(_newGame));
  }
}
