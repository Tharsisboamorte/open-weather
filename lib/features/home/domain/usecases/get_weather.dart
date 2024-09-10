import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';
import 'package:open_weather/core/usecase/usecase.dart';
import 'package:open_weather/core/utils/typedef.dart';
import 'package:open_weather/features/home/domain/entities/weather_data.dart';
import 'package:open_weather/features/home/domain/repository/home_repo.dart';

class GetWeather extends UsecaseWithParams<WeatherData, GetWeatherParams> {
  const GetWeather(this._homeRepository);

  final HomeRepository _homeRepository;

  @override
  ResultFuture<WeatherData> call(GetWeatherParams params) async{
    final logger = Logger();
    final response = await _homeRepository.getWeather(
      latitude: params.latitude,
      longitude: params.longitude,
    );
    logger.i(response);
    return response;
  }
}

class GetWeatherParams extends Equatable {
  const GetWeatherParams({
    required this.latitude,
    required this.longitude,
  });

  final double latitude;
  final double longitude;

  @override
  List<Object?> get props => [latitude, longitude];
}
