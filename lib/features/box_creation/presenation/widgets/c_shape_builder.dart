import 'package:aeria/features/box_creation/presenation/cubit/box_creation_state.dart';
import 'package:aeria/features/box_creation/presenation/widgets/box_widget.dart';
import 'package:flutter/material.dart';

class CShapeBuilder extends StatelessWidget {
  const CShapeBuilder({super.key, required this.state, required this.onBoxTap});

  final BoxCreationState state;
  final void Function(int) onBoxTap;

  @override
  Widget build(BuildContext context) {
    final n = state.count;
    if (n < 5) {
      return const Text('At least 5 boxes required for C-shape');
    }

    final top = (n / 3).ceil();
    final bottom = top;
    final side = n - top - bottom;
    int idx = 0;

    List<Widget> rows = [];

    // Top row
    rows.add(
      Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(top, (_) {
          return BoxWidget(
            isGreen: state.colors[idx],
            onTap: () => onBoxTap(idx++),
            size: Size.square(50),
          );
        }),
      ),
    );

    // Vertical side
    for (var i = 0; i < side; i++) {
      rows.add(
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            BoxWidget(
              isGreen: state.colors[idx],
              onTap: () => onBoxTap(idx),
              size: Size.square(50),
            ),
          ],
        ),
      );
      idx++;
    }

    // Bottom row
    rows.add(
      Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(bottom, (_) {
          return BoxWidget(
            size: Size.square(50),
            isGreen: state.colors[idx],
            onTap: () => onBoxTap(idx++),
          );
        }),
      ),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: rows,
    );
  }
}
