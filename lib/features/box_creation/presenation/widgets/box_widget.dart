import 'package:flutter/material.dart';

class BoxWidget extends StatelessWidget {
  const BoxWidget({
    super.key,
    required this.isGreen,
    required this.onTap,
    required this.size,
  });

  final bool isGreen;
  final VoidCallback onTap;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width,
        height: size.height,
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: isGreen ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}
