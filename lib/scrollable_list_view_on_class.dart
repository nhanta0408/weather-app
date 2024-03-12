import 'package:flutter/material.dart';

class ScrollableListViewOnClass extends StatelessWidget {
  ScrollableListViewOnClass({super.key});

  List<String> players = [
    'De Gea',
    'Vidic',
    'Ferdinand',
    'Carrick',
    'Scholes',
    'Ronaldo',
    'Rooney',
    'De Gea',
    'Vidic',
    'Ferdinand',
    'Carrick',
    'Scholes',
    'Ronaldo',
    'Rooney',
    'De Gea',
    'Vidic',
    'Ferdinand',
    'Carrick',
    'Scholes',
    'Ronaldo',
    'Rooney',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.red,
        child: ListView.separated(
          itemCount: players.length,
          itemBuilder: (context, index) {
            return _buildItem(players[index]);
          },
          separatorBuilder: (context, index) {
            // return const Padding(
            //   padding: EdgeInsets.symmetric(vertical: 8),
            //   child: Divider(
            //     height: 1,
            //     thickness: 1,
            //     color: Colors.yellow,
            //   ),
            // );
            return const SizedBox(
              height: 16,
            );
          },
        ),
      ),
    );
  }

  Widget _buildItem(String value) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey,
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(
        left: 16,
      ),
      child: Text(
        value,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
