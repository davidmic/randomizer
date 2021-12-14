import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RandomizerPage extends HookWidget {
  RandomizerPage({Key? key, required this.min, required this.max})
      : super(key: key);
  final int min;
  final int max;
  final randomGenerator = Random();

  @override
  Widget build(BuildContext context) {
    final _generatedNumber = useState<int?>(null);
    return Scaffold(
      appBar: AppBar(
        title: Text("Randomizer"),
      ),
      body: Center(
          child: Text(
        _generatedNumber?.toString() ?? 'Generate a number',
        style: TextStyle(fontSize: 42),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Generate'),
        onPressed: () {
          _generatedNumber.value =
              (min + randomGenerator.nextInt(max + 1 - min));
        },
      ),
    );
    ;
  }
}
