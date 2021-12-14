import 'package:flutter/material.dart';
import 'package:foundation/range_selector_page.dart';
import 'package:foundation/state_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const AppWidget());
}

final randomizerNotifier =
    ChangeNotifierProvider((ref) => RandomizerChangeNotifier());

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Randomiser',
        home: MyRandomiserPage(),
      ),
    );
  }
}
