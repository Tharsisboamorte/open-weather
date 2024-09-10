import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:open_weather/core/errors/execptions.dart';
import 'package:open_weather/core/errors/failure.dart';
import 'package:open_weather/core/utils/typedef.dart';
import 'package:open_weather/features/home/data/datasources/home_data_sources.dart';
import 'package:open_weather/features/home/domain/entities/weather_data.dart';
import 'package:open_weather/features/home/domain/repository/home_repo.dart';

class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl(this._homeDataSource);

  final HomeDataSource _homeDataSource;

  @override
  ResultFuture<WeatherData> getWeather({
    required double latitude,
    required double longitude,
  }) async {
    final logger = Logger();
    try {
      final result = await _homeDataSource.getWeather(
        latitude: latitude,
        longitude: longitude,
      );
      logger.i('getWeather :: $result');
      return Right(result);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }
}
