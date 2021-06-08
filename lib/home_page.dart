import 'package:flutter/material.dart';

import './models/card.dart' as waro_c;
import './models/config.dart';
import './models/game.dart';
import './util/constants.dart';
import './util/logger.dart';
import './widgets/about.dart';
import './widgets/config_form.dart';
import './widgets/tableau.dart';
import './widgets/welcome.dart';

class MyHomePage extends StatefulWidget {
  static const rootRoute = '/';

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Game _game;
  AppBar _appBar;

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
    Navigator.of(context).pushNamed(ConfigForm.routeName,
        arguments: {C.CONFIG_PARAM: Config.instance});
  }

  void _pushAbout() {
    Navigator.of(context).pushNamed(About.routeName,
        arguments: {C.CONFIG_PARAM: Config.instance});
  }

  void _cancelGame() {
    setState(() {
      L.log('user cancelled');
      _game.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    _appBar = AppBar(
      title: Text(widget.title),
      actions: [
        IconButton(icon: Icon(Icons.settings), onPressed: _pushConfig),
        IconButton(icon: Icon(Icons.info), onPressed: _pushAbout),
      ],
    );
    var actionButton = (_isGameInProgress())
        ? FloatingActionButton(
            onPressed: _cancelGame,
            tooltip: C.QUIT_GAME,
            child: Icon(Icons.cancel),
          )
        : FloatingActionButton(
            onPressed: _newGame,
            tooltip: C.NEW_GAME,
            child: Icon(Icons.add),
          );

    return Scaffold(
      appBar: _appBar,
      body: (_isGameInProgress())
          ? Tableau(_game.table, _playCard, _newGame)
          : Welcome(_appBar),
      floatingActionButton: actionButton,
    );
  }
}
