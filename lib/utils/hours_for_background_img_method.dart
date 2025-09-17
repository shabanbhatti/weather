bool isDay(String dtTxt) {
  final hour = DateTime.parse(dtTxt).hour;
  return hour >= 6 && hour < 18;
}