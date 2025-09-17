class WeatherModel {
  final String? cod;
  final int? message;
  final int? cnt;
  final List<ForecastItem>? list;
  final City? city;

  WeatherModel({this.cod, this.message, this.cnt, this.list, this.city});

   factory WeatherModel.empty() {
    return WeatherModel(
      city: City(
        name: '',
        coord: Coord(lat: 0.0, lon: 0.0),
        country: '',
      ),
      list: [],
    );
  }

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cod: json['cod'],
      message: json['message'],
      cnt: json['cnt'],
      list: (json['list'] as List?)
          ?.map((e) => ForecastItem.fromJson(e))
          .toList(),
      city: json['city'] != null ? City.fromJson(json['city']) : null,
    );
  }
}

class ForecastItem {
  final int? dt;
  final MainData? main;
  final List<Weather>? weather;
  final Clouds? clouds;
  final Wind? wind;
  final int? visibility;
  final double? pop;
  final Rain? rain;
  final Sys? sys;
  final String? dtTxt;

  ForecastItem({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    this.pop,
    this.rain,
    this.sys,
    this.dtTxt,
  });

  factory ForecastItem.fromJson(Map<String, dynamic> json) {
    return ForecastItem(
      dt: json['dt'],
      main: json['main'] != null ? MainData.fromJson(json['main']) : null,
      weather: (json['weather'] as List?)
          ?.map((e) => Weather.fromJson(e))
          .toList(),
      clouds: json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null,
      wind: json['wind'] != null ? Wind.fromJson(json['wind']) : null,
      visibility: json['visibility'],
      pop: (json['pop'] as num?)?.toDouble(),
      rain: json['rain'] != null ? Rain.fromJson(json['rain']) : null,
      sys: json['sys'] != null ? Sys.fromJson(json['sys']) : null,
      dtTxt: json['dt_txt'],
    );
  }
}

class MainData {
  final double? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int? pressure;
  final int? seaLevel;
  final int? grndLevel;
  final int? humidity;
  final double? tempKf;

  MainData({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.seaLevel,
    this.grndLevel,
    this.humidity,
    this.tempKf,
  });

  factory MainData.fromJson(Map<String, dynamic> json) {
    return MainData(
      temp: (json['temp'] as num?)?.toDouble(),
      feelsLike: (json['feels_like'] as num?)?.toDouble(),
      tempMin: (json['temp_min'] as num?)?.toDouble(),
      tempMax: (json['temp_max'] as num?)?.toDouble(),
      pressure: json['pressure'],
      seaLevel: json['sea_level'],
      grndLevel: json['grnd_level'],
      humidity: json['humidity'],
      tempKf: (json['temp_kf'] as num?)?.toDouble(),
    );
  }
}

class Weather {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}

class Clouds {
  final int? all;

  Clouds({this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(all: json['all']);
  }
}

class Wind {
  final double? speed;
  final int? deg;
  final double? gust;

  Wind({this.speed, this.deg, this.gust});

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: (json['speed'] as num?)?.toDouble(),
      deg: json['deg'],
      gust: (json['gust'] as num?)?.toDouble(),
    );
  }
}

class Rain {
  final double? threeHour;

  Rain({this.threeHour});

  factory Rain.fromJson(Map<String, dynamic> json) {
    return Rain(
      threeHour: (json['3h'] as num?)?.toDouble(),
    );
  }
}

class Sys {
  final String? pod;

  Sys({this.pod});

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(pod: json['pod']);
  }
}

class City {
  final int? id;
  final String? name;
  final Coord? coord;
  final String? country;
  final int? population;
  final int? timezone;
  final int? sunrise;
  final int? sunset;

  City({
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      name: json['name'],
      coord: json['coord'] != null ? Coord.fromJson(json['coord']) : null,
      country: json['country'],
      population: json['population'],
      timezone: json['timezone'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }
}

class Coord {
  final double? lat;
  final double? lon;

  Coord({this.lat, this.lon});

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );
  }
}