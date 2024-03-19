import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../extension/date_ext.dart';
import '../../models/weather_city.dart';
import 'widgets/weather_forecast_time_item_widget.dart';
import 'widgets/weather_index_widget.dart';

class WeatherDetailScreen extends StatelessWidget {
  static String screenName = '/detail';

  WeatherCity? weatherCityData;
  WeatherDetailScreen({super.key, this.weatherCityData});

  @override
  Widget build(BuildContext context) {
    print('Đã vào màn hình detail của city: ${weatherCityData?.city}');
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              weatherCityData?.time?.isNight() == true
                  ? 'assets/images/bg_night.png'
                  : 'assets/images/bg.png', // conditional operator
              // default => bg.png
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  // ko vượt qua bound -> tự set size
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Icon(
                                Icons.chevron_left,
                                size: 32,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Text(
                            '10.82, 206.24',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            width: 40, // 32 + 8
                            height: 0,
                          ), // Balancer
                        ],
                      ),
                      Text(
                        weatherCityData?.city ?? '--',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      Image.asset(
                        weatherCityData?.status == WeatherStatus.sunny
                            ? 'assets/images/sunny_weather.png'
                            : 'assets/images/night_weather.png',
                      ),
                      Text(
                        weatherCityData?.weatherDesc ?? '--',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        '${weatherCityData?.temperature.toStringAsFixed(0)}°C',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 64,
                        ),
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
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
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
