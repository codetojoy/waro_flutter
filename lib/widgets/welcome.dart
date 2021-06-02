import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  final Function _newGameHandler;

  Welcome(this._newGameHandler);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FractionallySizedBox(
      child: Card(
          child: Column(children: [
            Flexible(
                child: FractionallySizedBox(
              child: const Text('War-O Flutter',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              widthFactor: 0.5,
              heightFactor: 0.5,
            )),
            Flexible(
              child: FractionallySizedBox(
                child: FloatingActionButton(
                  onPressed: _newGameHandler,
                  tooltip: 'New Game',
                  child: Icon(Icons.add),
                ),
                widthFactor: 0.5,
                heightFactor: 0.5,
              ),
            ),
          ]),
          elevation: 20,
          shadowColor: Theme.of(context).primaryColor),
      widthFactor: 0.8,
      heightFactor: 0.4,
      alignment: Alignment.center,
    ));
  }
}
