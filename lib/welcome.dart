import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  final Function _newGameHandler;

  Welcome(this._newGameHandler);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Welcome to War-O',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
          FloatingActionButton(
            onPressed: _newGameHandler,
            tooltip: 'New Game',
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
/*
class Quiz extends StatelessWidget {
  final List<Map<Object, Object>> _questions;
  final int _questionIndex;
  final Function _answerHandler;
  Quiz(this._questions, this._questionIndex, this._answerHandler);

  @override
  Widget build(BuildContext context) {
    var answers = _questions[_questionIndex]['answers'] as List<Map>;
    var answerWidgets = answers.map((answer) {
      return Answer(answer['text'], () => _answerHandler(answer['score']));
    }).toList();

    return Column(children: <Widget>[
      Question(
        _questions[_questionIndex]['questionText'],
      ),
      ...answerWidgets,
    ]);
  }
}
*/
