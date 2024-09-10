import 'package:open_weather/core/utils/typedef.dart';
import 'package:open_weather/features/home/domain/entities/weather_data.dart';

abstract class HomeRepository {
  const HomeRepository();

  ResultFuture<WeatherData> getWeather({
    required double latitude,
    required double longitude,
  });
}
