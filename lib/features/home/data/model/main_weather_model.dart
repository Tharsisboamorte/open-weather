
import 'package:logger/logger.dart';
import 'package:open_weather/core/utils/typedef.dart';
import 'package:open_weather/features/home/domain/entities/main_weather.dart';

class MainWeatherModel extends MainWeather {
  const MainWeatherModel({
    required super.temp,
    required super.feelsLike,
    required super.tempMin,
    required super.tempMax,
    required super.pressure,
    required super.humidity,
    required super.seaLevel,
    required super.groundLevel,
  });

  factory MainWeatherModel.fromJson(DataMap? source) {
    Logger().i(source);
    return MainWeatherModel(
      temp: source?['temp'] as double,
      feelsLike: source?['feels_like']as double,
      tempMin: source?['temp_min']as double,
      tempMax: source?['temp_max']as double,
      pressure: source?['pressure']as int,
      humidity: source?['humidity']as int,
      seaLevel: source?['sea_level']as int,
      groundLevel: source?['grnd_level']as int,
    );
  }

}
