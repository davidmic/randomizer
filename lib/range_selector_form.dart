import 'package:flutter/material.dart';

typedef IntValueSetter = void Function(int value);

class RangeSelectorForm extends StatelessWidget {
  const RangeSelectorForm({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.minValueSetter,
    required this.maxValueSetter,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  final IntValueSetter minValueSetter;

  final IntValueSetter maxValueSetter;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RangeSelectorFormField(
            labelText: 'Minimum',
            intValueSetter: minValueSetter,
          ),
          const SizedBox(height: 12),
          RangeSelectorFormField(
            labelText: 'Maximum',
            intValueSetter: maxValueSetter,
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
