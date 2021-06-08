import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/config.dart';
import '../util/constants.dart';
import '../util/logger.dart';

// TODO: rename as Config or ConfigWidget
class ConfigForm extends StatefulWidget {
  static const routeName = '/config';

  @override
  ConfigFormState createState() {
    return ConfigFormState();
  }
}

class ConfigFormState extends State<ConfigForm> {
  final _formKey = GlobalKey<FormState>();
  final _numCardsController = TextEditingController();
  String _sortValue = C.SORT_NONE;

  @override
  Widget build(BuildContext context) {
    var routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    var config = routeArgs[C.CONFIG_PARAM] as Config;
    return Scaffold(
      appBar: AppBar(
        title: Text('Config'),
      ),
      body: _buildForm(context, config),
    );
  }

  Widget _buildForm(BuildContext context, Config config) {
    var numActors = config.numPlayers + 1;
    var prompt = 'Enter # of cards (divisible by $numActors)';
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: new InputDecoration(labelText: prompt),
            keyboardType: TextInputType.number,
            controller: _numCardsController,
            validator: (value) {
              int numCards = int.parse(value);
              if (!config.isValid(numCards)) {
                var numActors = config.numPlayers + 1;
                return '# of cards must be divisible by $numActors';
              }
              return null;
            },
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ], // Only numbers can be entered
          ),
          DropdownButtonFormField(
            decoration: const InputDecoration(labelText: 'sort order'),
            value: C.SORT_NONE,
            items: <String>[C.SORT_NONE, C.SORT_ASC, C.SORT_DESC]
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {
              L.log('TRACER drop down $value');
              _sortValue = value;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  int numCards = int.parse(_numCardsController.text);
                  config.numCards = numCards;
                  config.sortOrder = _sortValue;
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: const Text('Saved!')));
                }
              },
              child: const Text('Save'),
            ),
          ),
        ],
      ),
    );
  }
}
