import 'dart:math';

import 'package:flutter/material.dart';

import 'select_gender_widget.dart';
import 'weather_home_screen.dart';

enum Gender { male, female, other }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // body: Center(
      //   child: Container(
      //     padding: const EdgeInsets.all(16),
      //     child: const SelectGenderWidget(),
      //   ),
      // ),
      body: SelectGenderWidget(),
    );
  }
}
