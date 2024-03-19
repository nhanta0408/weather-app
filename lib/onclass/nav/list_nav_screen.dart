import 'package:flutter/material.dart';

import 'detail_nav_screen.dart';

class ListNavScreen extends StatelessWidget {
  static String screenName = '/list';

  // Cmd D  Ctrl D
  const ListNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          color: Colors.white,
          iconSize: 32,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'List Screen',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const DetailNavScreen(),
                //   ),
                // );
                Navigator.pushNamed(context, DetailNavScreen.screenName);
              },
              child: Container(
                margin: const EdgeInsets.all(16),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.cyan,
                ),
                alignment: Alignment.center,
                child: Text(
                  'Item ${index + 1}',
                  style: const TextStyle(fontSize: 32),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
