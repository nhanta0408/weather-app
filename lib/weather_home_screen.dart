import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'weather_forecast_time_item_widget.dart';
import 'weather_index_widget.dart';

class WeatherHomeScreen extends StatelessWidget {
  const WeatherHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/bg.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    '10.82, 206.24',
                    style: TextStyle(fontSize: 16),
                  ),
                  const Text(
                    'Hồ Chí Minh City',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Image.asset('assets/images/sunny_weather.png'),
                  const Text(
                    'Soft light',
                    style: TextStyle(fontSize: 16),
                  ),
                  const Text(
                    '32°C',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 64),
                  ),
                  const Text(
                    'Duststorm, sandstorm, drifting or blowing snow',
                    style: TextStyle(fontSize: 16),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.all(16),
                    child: _buildWeatherIndex(),
                  ),
                  _buildWeatherForecast(),
                ],
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.menu),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherIndex() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WeatherIndexWidget(
              title: 'Humidity',
              value: '40%',
            ),
            const SizedBox(
              height: 16,
            ),
            WeatherIndexWidget(
              title: 'PM10',
              value: '33.4μg/m³',
            ),
            const SizedBox(
              height: 16,
            ),
            WeatherIndexWidget(
              title: 'UV',
              value: '2.2',
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            WeatherIndexWidget(
              title: 'Wind',
              value: '2km/h',
            ),
            const SizedBox(
              height: 16,
            ),
            WeatherIndexWidget(
              title: 'Sunrise',
              value: '6:35',
            ),
            const SizedBox(
              height: 16,
            ),
            WeatherIndexWidget(
              title: 'Sunset',
              value: '17:55',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildWeatherForecast() {
    final hourArray = List.generate(24, (index) => index);
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          const Row(
            children: [
              Icon(
                Icons.wb_sunny,
                color: Color(0xFFCAD1D2),
                size: 16,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                'FORECAST',
                style: TextStyle(color: Color(0xFFCAD1D2), fontSize: 12),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(
              height: 1,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WeatherIndexWidget(
                title: 'Max:',
                value: '36.4°C',
              ),
              WeatherIndexWidget(
                title: 'Min',
                value: '22.1°C',
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: hourArray
                  .map(
                    (e) => WeatherForecastTimeItemWidget(
                      hour: e,
                      imageAsset: 'assets/images/sunny_weather.png',
                      temperature: 22,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
