import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foundation/range_selector_form.dart';

import 'randomizer.dart';

class MyRandomiserPage extends HookWidget {
  MyRandomiserPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _min = useState<int>(0);
    final _max = useState<int>(0);

    return Scaffold(
      appBar: AppBar(
        title: Text('Select Range'),
      ),
      body: RangeSelectorForm(
        formKey: _formKey,
        minValueSetter: (value) => _min.value = value,
        maxValueSetter: (value) => _max.value = value,
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
                        min: _min.value,
                        max: _max.value,
                      )));
        },
      ),
    );
  }
}
