import 'package:flutter/material.dart';
import 'package:foundation/range_selector_page.dart';
import 'package:foundation/state_manager.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RandomizerChangeNotifier(),
      child: MaterialApp(
        title: 'Randomiser',
        home: MyRandomiserPage(),
      ),
    );
  }
}
