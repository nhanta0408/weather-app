import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

import '../../models/weather_city.dart';

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
      status: WeatherStatus.rain,
      temperature: 12,
    ),
    WeatherCity(
      city: 'London City',
      time: DateTime.now(),
      weatherDesc: 'Peace Night',
      status: WeatherStatus.rain,
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
    WeatherCity(
      city: 'Paris City',
      time: DateTime.now(),
      weatherDesc: 'Peace Night',
      status: WeatherStatus.sunny,
      temperature: 7,
    ),
    WeatherCity(
      city: 'Paris City',
      time: DateTime.now(),
      weatherDesc: 'Peace Night',
      status: WeatherStatus.sunny,
      temperature: 7,
    ),
  ];

  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            controller: _scrollController,
            itemCount: weatherCities.length,
            itemBuilder: (context, index) {
              return _buildItem(weatherCities[index]);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 8,
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: ElevatedButton(
            onPressed: () {
              // Scroll to top
              _scrollController.animateTo(
                0,
                duration: const Duration(seconds: 1),
                curve: Curves.linear,
              );
            },
            child: const Text('Scroll To Top'),
          ),
        ),
      ],
    );
  }

  Widget _buildItem(WeatherCity weatherCity) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.blue[400],
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          image: AssetImage(
            weatherCity.status == WeatherStatus.sunny
                ? 'assets/images/bg.png'
                : 'assets/images/bg_night.png',
          ),
        ),
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
              const SizedBox(
                height: 10,
              ),
              Text(
                formatDate(weatherCity.time, [h, ':', nn]),
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 10,
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
                style: const TextStyle(fontSize: 36),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
