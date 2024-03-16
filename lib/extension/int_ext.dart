extension IntExt on int {
  String hourWithAMPM() {
    if (0 <= this && this <= 11) {
      return '$this AM';
    } else if (this == 12) {
      return '$this PM';
    } else {
      return '${this - 12} PM';
    }
  }
}
