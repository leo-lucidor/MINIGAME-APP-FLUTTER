import 'package:flutter/material.dart';
import 'package:minigame_app/UI/games/reaction_time.dart';
import 'package:minigame_app/UI/games/VisualMemory.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VisualMemoryScreen(title: 'Visual Memory'),
    );
  }
}