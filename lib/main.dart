import 'package:flutter/material.dart';
import 'package:foundation/range_selector_page.dart';

void main() {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Randomiser',
      home: MyRandomiserPage(),
    );
  }
}
