import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'models/weather_city.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  List<WeatherCity> weatherCities = [
    WeatherCity(
      city: 'Hồ Chí Minh City',
      time: DateTime.now(),
      weatherDesc: 'Sunny thunderstorm',
      status: WeatherStatus.sunny,
      temperature: 32,
    ),
    WeatherCity(
      city: 'Hà Nội City',
      time: DateTime.now(),
      weatherDesc: 'Sunny thunderstorm',
      status: WeatherStatus.sunny,
      temperature: 26,
    ),
    WeatherCity(
      city: 'New York City',
      time: DateTime.now(),
      weatherDesc: 'Peace Night',
      status: WeatherStatus.sunny,
      temperature: 12,
    ),
    WeatherCity(
      city: 'London City',
      time: DateTime.now(),
      weatherDesc: 'Peace Night',
      status: WeatherStatus.sunny,
      temperature: 6,
    ),
    WeatherCity(
      city: 'Seoul City',
      time: DateTime.now(),
      weatherDesc: 'Sunny thunderstorm',
      status: WeatherStatus.sunny,
      temperature: 21,
    ),
    WeatherCity(
      city: 'Paris City',
      time: DateTime.now(),
      weatherDesc: 'Peace Night',
      status: WeatherStatus.sunny,
      temperature: 7,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: weatherCities.length,
      itemBuilder: (context, index) {
        return _buildItem(weatherCities[index]);
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 8,
        );
      },
    );
  }

  Container _buildItem(WeatherCity weatherCity) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.blue[400],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                weatherCity.city,
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                formatDate(weatherCity.time, [h, ':', nn]),
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                weatherCity.weatherDesc,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                weatherCity.status == WeatherStatus.sunny
                    ? 'assets/images/sunny_weather.png'
                    : 'assets/images/night_weather.png',
                width: 48,
                height: 48,
              ),
              Text(
                '${weatherCity.temperature.toStringAsFixed(0)}°C',
                style:
                    const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
