
import 'package:open_weather/core/utils/typedef.dart';
import 'package:open_weather/features/home/domain/entities/weather.dart';

class WeatherModel extends Weather {
  const WeatherModel({
    required super.id,
    required super.main,
    required super.description,
    required super.icon,
  });

  factory WeatherModel.fromJson(DataMap? source) => WeatherModel(
        id: source?['id'] as int,
        main: source?['main'] as String,
        description: source?['description'] as String,
        icon: source?['icon'] as String,
      );

  WeatherModel.fromMap(DataMap map)
      : this(
          id: map['id'] as int,
          main: map['main'] as String,
          description: map['description'] as String,
          icon: map['icon'] as String,
        );
}
