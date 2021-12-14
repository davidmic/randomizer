import 'dart:math';

import 'package:flutter/material.dart';

class RandomizerChangeNotifier extends ChangeNotifier {
  int? _generatedNumber;

  int? get generatedNumber => _generatedNumber;

  final randomGenerator = Random();

  int min = 0;
  int max = 0;

  void calculateRandom() {
    _generatedNumber = (min + randomGenerator.nextInt(max + 1 - min));
    notifyListeners();
  }
}
