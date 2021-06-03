
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  About();

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(children: [
          const Text('About:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
        ]),
        elevation: 5);
  }
}
