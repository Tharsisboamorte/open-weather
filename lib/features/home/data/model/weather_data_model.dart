import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:open_weather/core/utils/typedef.dart';
import 'package:open_weather/features/home/data/model/clouds_model.dart';
import 'package:open_weather/features/home/data/model/coordinates_model.dart';
import 'package:open_weather/features/home/data/model/main_weather_model.dart';
import 'package:open_weather/features/home/data/model/sys_model.dart';
import 'package:open_weather/features/home/data/model/weather_model.dart';
import 'package:open_weather/features/home/data/model/wind_model.dart';
import 'package:open_weather/features/home/domain/entities/weather_data.dart';

class WeatherDataModel extends WeatherData {
  const WeatherDataModel({
    required super.coordinates,
    required super.weather,
    required super.base,
    required super.main,
    required super.visibility,
    required super.wind,
    required super.clouds,
    required super.dateTime,
    required super.sys,
    required super.timezone,
    required super.id,
    required super.name,
    required super.cod,
  });

  factory WeatherDataModel.fromJson(dynamic source) {
    Logger().i(source);
    return WeatherDataModel(
      coordinates: CoordinatesModel.fromJson(source['coord'] as DataMap?),
      weather: WeatherModel.fromJson(source['weather'][0] as DataMap),
      base: source['base'] as String,
      main: MainWeatherModel.fromJson(source['main'] as DataMap?),
      visibility: source['visibility'] as int,
      wind: WindModel.fromJson(source['wind'] as DataMap?),
      clouds: CloudsModel.fromJson(source['clouds'] as DataMap),
      dateTime: source['dt'] as int,
      sys: SysModel.fromJson(source['sys'] as DataMap),
      timezone: source['timezone'] as int,
      id: source['id'] as int,
      name: source['name'] as String,
      cod: source['cod'] as int,
    );
  }
}
