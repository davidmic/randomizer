import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foundation/main.dart';

typedef IntValueSetter = void Function(int value);

class RangeSelectorForm extends ConsumerWidget {
  const RangeSelectorForm({
    Key? key,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context, ref) {
    final rand = ref.read(randomizerNotifier.notifier);
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RangeSelectorFormField(
            labelText: 'Minimum',
            intValueSetter: (value) => rand.setMin(value),
          ),
          const SizedBox(height: 12),
          RangeSelectorFormField(
            labelText: 'Maximum',
            intValueSetter: (value) => rand.setMin(value),
          )
        ],
      ),
    );
  }
}

class RangeSelectorFormField extends StatelessWidget {
  final String labelText;
  final IntValueSetter intValueSetter;
  const RangeSelectorFormField(
      {Key? key, required this.labelText, required this.intValueSetter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
      ),
      validator: (value) {
        if (value == null || int.tryParse(value) == null) {
          return "Must contain a value";
        }
        return null;
      },
      onSaved: (newValue) => intValueSetter(int.parse(newValue ?? '')),
      keyboardType:
          const TextInputType.numberWithOptions(decimal: false, signed: true),
    );
  }
}
