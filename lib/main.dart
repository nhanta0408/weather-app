import 'dart:math';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'detail/presentation/weather_detail_screen.dart';
import 'home/presentation/home_screen.dart';
import 'models/weather_city.dart';

enum Gender { male, female, other }

void main() {
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/': // trang mặc định, home
            return MaterialPageRoute(
              builder: (context) => HomeScreen(),
            );
          case '/detail': // trang detail
            final arg = settings.arguments as WeatherCity?; // ép kiểu
            return MaterialPageRoute(
              builder: (context) => WeatherDetailScreen(
                weatherCityData: arg,
              ),
            );
        }
        return null;
      },
      home: HomeScreen(),
    );
  }
}
