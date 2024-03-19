// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../extension/int_ext.dart';

class WeatherForecastTimeItemWidget extends StatelessWidget {
  final int hour;
  final String imageAsset;
  final int temperature;
  const WeatherForecastTimeItemWidget({
    Key? key,
    required this.hour,
    required this.imageAsset,
    required this.temperature,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            hour.hourWithAMPM(),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 8,
          ),
          Image.asset(
            imageAsset,
            height: 24,
            width: 24,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            '$temperature°C',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
