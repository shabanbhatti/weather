import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:weather_project/models/timezone_model.dart';
import 'package:weather_project/models/weather_API_model.dart';

class ApiService {
  final String apiKey = '0e92d667a88e587b21900e01f954d6dc';

  String url({required String cityName}) {
    return 'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=$apiKey';
  }

  final String timeApiKey = 'SSXE8KA3DUFM';

  String timeUrl({required double lon, required double lat}) {
    return 'https://api.timezonedb.com/v2.1/get-time-zone?key=$timeApiKey&format=json&by=position&lat=$lat&lng=$lon';
  }

  Future<WeatherModel> fetchWeather({String? cityName}) async {
    var responce = await get(Uri.parse(url(cityName: cityName!)));

    // print('List length: ${jsonDecode(responce.body)}');

    Map<String, dynamic> data = jsonDecode(responce.body);

    if (responce.statusCode == 200 || responce.statusCode == 201) {
      print(data);

      return WeatherModel.fromJson(data);
    } else {
      return throw Exception('ERROR 404: api not found');
    }
  }

  Future<TimezoneModel> fetchTime({double? lon, double? lat}) async {
    Position position = await Geolocator.getCurrentPosition();

    double lonX = (lon == null) ? position.longitude : lon;
    double latX = (lat == null) ? position.latitude : lat;

    var responce = await get(Uri.parse(timeUrl(lon: lonX, lat: latX)));

    var data = jsonDecode(responce.body);

    if (responce.statusCode == 200 || responce.statusCode == 201) {
      return TimezoneModel.fromJson(data);
    } else {
      return throw Exception('ERROR by fetching time');
    }
  }
}
