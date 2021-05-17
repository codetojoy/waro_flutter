import 'package:flutter/material.dart';

import './card.dart' as waro_c;
import './game.dart';
import './logger.dart';
import './tableau.dart';
import './time.dart';
import './welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String _version() {
    var version = "mon-17";
    var now = new Time().now();
    return 'waro v $version $now';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _version(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
        _game.findGameWinner();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: (_isGameInProgress())
            ? Tableau(_game.table, _playCard)
            : Welcome(_newGame));
  }
}
