import 'dart:math';

import 'package:flutter/material.dart';
import 'package:foundation/state_manager.dart';
import 'package:provider/provider.dart';

class RandomizerPage extends StatelessWidget {
  RandomizerPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Randomizer"),
      ),
      body: Center(child: Consumer<RandomizerChangeNotifier>(
        builder: (con, notifier, child) {
          return Text(
            notifier.generatedNumber?.toString() ?? 'Generate a number',
            style: TextStyle(fontSize: 42),
          );
        },
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Generate'),
        onPressed: () {
          context.read<RandomizerChangeNotifier>().calculateRandom();
        },
      ),
    );
    ;
  }
}
