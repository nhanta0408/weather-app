// ignore_for_file: public_member_api_docs, sort_constructors_first
enum WeatherStatus { sunny, rain }

class WeatherCity {
  String city;
  DateTime time;
  String weatherDesc;
  WeatherStatus status;
  double temperature;
  WeatherCity({
    required this.city,
    required this.time,
    required this.weatherDesc,
    required this.status,
    required this.temperature,
  });
}
