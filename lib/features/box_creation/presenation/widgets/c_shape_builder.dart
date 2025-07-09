import 'dart:developer';

import 'package:aeria/features/box_creation/presenation/cubit/box_creation_state.dart';
import 'package:aeria/features/box_creation/presenation/widgets/box_widget.dart';
import 'package:flutter/material.dart';

class CShapeBuilder extends StatelessWidget {
  const CShapeBuilder({
    super.key,
    required this.state,
    required this.onBoxTap,
    required this.maxWidth,
  });

  final BoxCreationState state;
  final double maxWidth;
  final void Function(int) onBoxTap;

  @override
  Widget build(BuildContext context) {
    final n = state.count;
    double size = 50;
    final top = (n / 3).ceil();
    final bottom = top;
    final side = n - top - bottom;
    final gap = 5.0;
    final tottalGap = gap * (top);
    size = (maxWidth - tottalGap) / top;
    log("$maxWidth,$size");

    int idx = 0;

    List<Widget> rows = [];

    if (size > 1) {
      // Top row
      rows.add(
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(top, (_) {
            return BoxWidget(
              isGreen: state.colors[idx],
              onTap: () => onBoxTap(idx++),
              size: Size.square(size.toDouble()),
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
                size: Size.square(size.toDouble()),
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
              size: Size.square(size.toDouble()),
              isGreen: state.colors[idx],
              onTap: () => onBoxTap(idx++),
            );
          }),
        ),
      );
    }
    return size < 1
        ? Column(
          children: [
            Text(
              "Box size is not big enough to display -> $size",
              style: TextStyle(color: Colors.red),
            ),
          ],
        )
        : Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: rows,
        );
  }
}
