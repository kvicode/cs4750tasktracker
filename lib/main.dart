import 'package:flutter/material.dart';
import 'package:cs4750tasktracker/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.lightGreen),
    );
  }
}