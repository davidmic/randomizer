import 'package:flutter/material.dart';
import 'package:foundation/state_manager.dart';
import 'package:provider/provider.dart';

typedef IntValueSetter = void Function(int value);

class RangeSelectorForm extends StatelessWidget {
  const RangeSelectorForm({
    Key? key,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RangeSelectorFormField(
            labelText: 'Minimum',
            intValueSetter: (value) =>
                context.read<RandomizerChangeNotifier>().min = value,
          ),
          const SizedBox(height: 12),
          RangeSelectorFormField(
            labelText: 'Maximum',
            intValueSetter: (value) =>
                context.read<RandomizerChangeNotifier>().max = value,
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
