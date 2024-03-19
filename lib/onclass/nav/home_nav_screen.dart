import 'package:flutter/material.dart';

import 'detail_nav_screen.dart';
import 'list_nav_screen.dart';

class HomeNavScreen extends StatelessWidget {
  static String screenName = '/';
  const HomeNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Home Screen',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const ListNavScreen(),
                //   ),
                // );
                Navigator.pushNamed(context, ListNavScreen.screenName);
              },
              child: const Text(
                'Go to List Screen',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 64,
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const DetailNavScreen(),
                //   ),
                // );
                Navigator.pushNamed(context, DetailNavScreen.screenName);
              },
              child: const Text(
                'Go to Random Detail Screen',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
