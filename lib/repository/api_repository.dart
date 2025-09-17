import 'package:weather_project/models/timezone_model.dart';
import 'package:weather_project/models/weather_API_model.dart';
import 'package:weather_project/services/api_service.dart';
import 'package:weather_project/services/location_service.dart';

class ApiRepository {
  final ApiService apiService;
  const ApiRepository({required this.apiService});

  Future<({WeatherModel? weather, TimezoneModel? timezone})?> fetchWeather({
    String? city,
  }) async {
    try {
      var cityByLocation = await LocationService.getCityLocation();

      var data = await apiService.fetchWeather(
        cityName: city ?? cityByLocation,
      );
      var timezone = await apiService.fetchTime(
        lat: data.city!.coord!.lat,
        lon: data.city!.coord!.lon,
      );
      return (weather: data, timezone: timezone);
    } catch (e) {
      return throw Exception('Failed to fetch weather: $e');
    }
  }
}
