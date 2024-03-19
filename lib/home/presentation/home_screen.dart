import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

import '../../detail/presentation/weather_detail_screen.dart';
import '../../extension/date_ext.dart';
import '../../models/weather_city.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  List<WeatherCity> weatherCities = [
    WeatherCity(
      city: 'Hồ Chí Minh City',
      weatherDesc: 'Night thunderstorm',
      temperature: 32,
    ),
    WeatherCity(
      city: 'Hà Nội City',
      time: DateTime.now(),
      weatherDesc: 'Night thunderstorm',
      status: WeatherStatus.sunny,
      temperature: 26,
    ),
    WeatherCity(
      city: 'New York City',
      time: DateTime.now().subtract(const Duration(hours: 12)),
      weatherDesc: 'Peace Noon',
      status: WeatherStatus.rain,
      temperature: 12,
    ),
    WeatherCity(
      city: 'London City',
      time: DateTime.now().subtract(const Duration(hours: 7)),
      weatherDesc: 'Peace Noon',
      status: WeatherStatus.rain,
      temperature: 6,
    ),
    WeatherCity(
      city: 'Seoul City',
      time: DateTime.now().add(const Duration(hours: 2)),
      weatherDesc: 'Night thunderstorm',
      status: WeatherStatus.sunny,
      temperature: 21,
    ),
    WeatherCity(
      city: 'Paris City',
      time: DateTime.now().subtract(const Duration(hours: 6)),
      weatherDesc: 'Peace Noon',
      status: WeatherStatus.sunny,
      temperature: 7,
    ),
    WeatherCity(
      city: 'Paris City',
      time: DateTime.now().subtract(const Duration(hours: 6)),
      weatherDesc: 'Peace Noon',
      status: WeatherStatus.sunny,
      temperature: 7,
    ),
    WeatherCity(
      city: 'Paris City',
      time: DateTime.now().subtract(const Duration(hours: 6)),
      weatherDesc: 'Peace Noon',
      status: WeatherStatus.sunny,
      temperature: 7,
    ),
  ];

  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              controller: _scrollController,
              itemCount: weatherCities.length,
              itemBuilder: (context, index) {
                return _buildItem(context, weatherCities[index]);
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
      ),
    );
  }

  Widget _buildItem(BuildContext context, WeatherCity weatherCity) {
    return GestureDetector(
      onTap: () {
        // Nav Method 2
        Navigator.pushNamed(
          context,
          WeatherDetailScreen.screenName,
          arguments: weatherCity,
        );

        // Nav Method 1
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) {
        //       return WeatherDetailScreen(
        //         weatherCityData: weatherCity,
        //       );
        //     },
        //   ),
        // );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.blue[400],
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage(
              weatherCity.time?.isNight() == true
                  ? 'assets/images/bg_night.png'
                  : 'assets/images/bg.png',
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
                  formatDate(weatherCity.time ?? DateTime.now(), [HH, ':', nn]),
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
      ),
    );
  }
}
