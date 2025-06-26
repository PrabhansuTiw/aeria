import 'package:aeria/features/box_creation/presenation/box_creation_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BoxGenerationApp());
}

class BoxGenerationApp extends StatelessWidget {
  const BoxGenerationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Aeria's Box generation demo",
      home: BoxCreationPage(),
    );
  }
}
