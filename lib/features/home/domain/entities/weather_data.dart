import 'package:equatable/equatable.dart';
import 'package:open_weather/features/home/domain/entities/clouds.dart';
import 'package:open_weather/features/home/domain/entities/coordinates.dart';
import 'package:open_weather/features/home/domain/entities/main_weather.dart';
import 'package:open_weather/features/home/domain/entities/sys.dart';
import 'package:open_weather/features/home/domain/entities/weather.dart';
import 'package:open_weather/features/home/domain/entities/wind.dart';

class WeatherData extends Equatable {
  const WeatherData({
    required this.coordinates,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dateTime,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  final Coordinates coordinates;
  final Weather weather;
  final String base;
  final MainWeather main;
  final int visibility;
  final Wind wind;
  final Clouds clouds;
  final int dateTime;
  final Sys sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  @override
  List<Object?> get props => [
        coordinates,
        weather,
        base,
        main,
        visibility,
        wind,
        clouds,
        dateTime,
        sys,
        timezone,
        id,
        name,
        cod,
      ];

  @override
  String toString() =>
      'WeatherData{coordinates: $coordinates, weather: $weather, base: $base, main: $main, visibility: $visibility, wind: $wind, clouds: $clouds, dateTime: $dateTime, sys: $sys, timezone: $timezone, id: $id, name: $name, cod: $cod}';
}
