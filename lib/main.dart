import 'package:flutter/material.dart';
import 'package:quiz_app/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz Demo',
      theme: ThemeData(
        fontFamily: 'quick',
      ),
      home: const HomeScreen(),
    );
  }
}


