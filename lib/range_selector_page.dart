import 'package:flutter/material.dart';
import 'package:foundation/range_selector_form.dart';

import 'randomizer.dart';

class MyRandomiserPage extends StatelessWidget {
  MyRandomiserPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Range'),
      ),
      body: RangeSelectorForm(
        formKey: _formKey,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward),
        onPressed: () {
          if (!_formKey.currentState!.validate()) {
            return;
          }
          _formKey.currentState!.save();
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => RandomizerPage()));
        },
      ),
    );
  }
}
