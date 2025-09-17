import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_project/models/timezone_model.dart';
import 'package:weather_project/models/weather_API_model.dart';
import 'package:weather_project/providers/apis_provider_obects.dart';
import 'package:weather_project/repository/api_repository.dart';

final apiSerProvider =
    StateNotifierProvider<ApiServiceStateNotifier, WeatherState>((ref) {
      return ApiServiceStateNotifier(
        apiRepository: ref.read(apiRepositoryProviderObject),
      );
    });

class ApiServiceStateNotifier extends StateNotifier<WeatherState> {
  final ApiRepository apiRepository;
  ApiServiceStateNotifier({required this.apiRepository})
    : super(LoadingState());

  Future<void> fetchWeather({String? city}) async {
    try {
      var data = await apiRepository.fetchWeather(city: city) ?? null;

      if (data == null) {
        print('Null');
        state = EmptyState();
      } else if (data.weather == null) {
        state = EmptyState();
      } else {
        print('HAS DATA');
        state = LoadedSuccessfuly(weather: data.weather!, time: data.timezone!);
      }
    } catch (e) {
      state = ErrorState(error: e.toString());
    }
  }

  // Future<bool> fetchWeather({String? city})async{
  //   try {
  //     var cityByLocation= await LocationService.getCityLocation();

  // var data= await apiService.fetchWeather(cityName: city??cityByLocation);
  // var timeData= await apiService.fetchTime(lat:data.city!.coord!.lat, lon: data.city!.coord!.lon);

  // if (data.city!.name!.isEmpty) {
  //   state= EmptyState();
  // }else{
  // state= LoadedSuccessfuly(weather: data, time: timeData);
  // }
  // return true;
  //   } catch (e) {

  // state = ErrorState(error: e.toString(),);
  // return false;
  //   }

  // }
}

sealed class WeatherState {
  const WeatherState();
}

class LoadingState extends WeatherState {
  const LoadingState();
}

class LoadedSuccessfuly extends WeatherState {
  final WeatherModel weather;
  final TimezoneModel time;
  const LoadedSuccessfuly({required this.weather, required this.time});
}

class ErrorState extends WeatherState {
  final String error;

  const ErrorState({required this.error});
}

class EmptyState extends WeatherState {
  const EmptyState();
}
