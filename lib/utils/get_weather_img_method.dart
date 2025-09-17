
import 'package:weather_project/utils/all_weathers_img_paths.dart';

String getWeatherImage({required String condition, required bool isDay}) {
  switch (condition.toLowerCase()) {
    case 'clear':
      return isDay ? clear_day : clear_night;
    case 'clouds':
      return isDay ? cloudy_day : cloudy_night;
    case 'drizzle':
      return isDay ? drizzle_day : drizzle_night;
    case 'haze':
      return isDay ? haze_day : haze_night;
    case 'rain':
      return isDay ? rain_day : rain_night;
    case 'snow':
      return isDay ? snow_day : snow_night;
    case 'thunderstorm':
      return isDay ? thund_day : thund_night;
    default:
      return isDay ? clear_day : clear_night;
  }
}
