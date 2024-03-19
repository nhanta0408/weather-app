extension DateTimeExt on DateTime {
  bool isNight() {
    return hour > 19 || hour < 5;
  }
}
