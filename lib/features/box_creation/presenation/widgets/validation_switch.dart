import 'package:flutter/material.dart';

class ValidationSwitch extends StatelessWidget {
  const ValidationSwitch({
    super.key,
    required this.validationNeeded,
    required this.onValidate,
  });

  final bool validationNeeded;
  final ValueChanged<bool> onValidate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Without rules'),
        Switch(value: validationNeeded, onChanged: onValidate),
        const Text('Rules'),
      ],
    );
  }
}
