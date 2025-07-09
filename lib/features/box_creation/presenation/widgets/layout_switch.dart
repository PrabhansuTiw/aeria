import 'package:flutter/material.dart';

class LayoutSwitch extends StatelessWidget {
  const LayoutSwitch({
    super.key,
    required this.isCShape,
    required this.onToggle,
  });

  final bool isCShape;
  final ValueChanged<bool> onToggle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Grid'),
        Switch(value: isCShape, onChanged: onToggle),
        const Text('C-Shape'),
      ],
    );
  }
}
