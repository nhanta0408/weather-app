import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(title: 'App của tôi'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          row1(),
          row2(),
        ],
      ),
    );
  }

  Row row2() {
    return Row(
      children: [
        item1(), //Width: 40
        item2(), // Expanded
        Container(
          width: 100,
          height: 200,
          color: Colors.purple,
        ),
      ],
    );
  }

  Expanded item2() {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 50,
            color: Colors.white,
          ),
          Container(
            height: 50,
            color: Colors.brown,
          ),
          Container(
            height: 50,
            color: Colors.cyan,
          ),
          Container(
            height: 50,
            color: Colors.red,
          ),
        ],
      ),
    );
  }

  Column item1() {
    return Column(
      children: [
        Container(
          height: 100,
          width: 40,
          color: Colors.black,
        ),
        Container(
          height: 100,
          width: 40,
          color: Colors.yellow,
        ),
      ],
    );
  }

  Row row1() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            height: 100,
            color: Colors.red,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: 100,
            color: Colors.green,
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 100,
            color: Colors.yellow,
          ),
        ),
      ],
    );
  }
}
