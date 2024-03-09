import 'package:flutter/material.dart';

class WeatherIndexWidget extends StatelessWidget {
  String title;
  String value;
  WeatherIndexWidget({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
