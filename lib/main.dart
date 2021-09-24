import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Main
void main() {
  runApp(const ProviderScope(child: LernenApp()));
}

// Material App
class LernenApp extends StatelessWidget {
  const LernenApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello",
      debugShowCheckedModeBanner: false,
      home: Scaffold(),
    );
  }
}