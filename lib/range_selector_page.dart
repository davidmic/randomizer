import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foundation/range_selector_form.dart';

import 'randomizer.dart';

// class MyRandomiserPage extends HookWidget {
//   const MyRandomiserPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

class MyRandomiserPage extends StatefulWidget {
  const MyRandomiserPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyRandomiserPage> createState() => _MyRandomiserPageState();
}

class _MyRandomiserPageState extends State<MyRandomiserPage> {
  int _min = 0;
  int _max = 0;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Range'),
      ),
      body: RangeSelectorForm(
        formKey: _formKey,
        minValueSetter: (value) => _min = value,
        maxValueSetter: (value) => _max = value,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward),
        onPressed: () {
          if (!_formKey.currentState!.validate()) {
            return;
          }
          _formKey.currentState!.save();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => RandomizerPage(
                        min: _min,
                        max: _max,
                      )));
        },
      ),
    );
  }
}
