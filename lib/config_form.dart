import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './config.dart';

class ConfigForm extends StatefulWidget {
  Config _config;

  ConfigForm(this._config);

  @override
  ConfigFormState createState() {
    return ConfigFormState(_config);
  }
}

class ConfigFormState extends State<ConfigForm> {
  final _formKey = GlobalKey<FormState>();
  final _numCardsController = TextEditingController();

  Config _config;

  ConfigFormState(this._config);

  @override
  Widget build(BuildContext context) {
    var numActors = _config.numPlayers + 1;
    var prompt = 'Enter # of cards (divisible by $numActors)';
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new TextFormField(
            decoration: new InputDecoration(labelText: prompt),
            keyboardType: TextInputType.number,
            controller: _numCardsController,
            validator: (value) {
              int numCards = int.parse(value);
              if (!_config.isValid(numCards)) {
                var numActors = _config.numPlayers + 1;
                return '# of cards must be divisible by $numActors';
              }
              return null;
            },
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ], // Only numbers can be entered
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  int numCards = int.parse(_numCardsController.text);
                  _config.numCards = numCards;
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Saved!')));
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
