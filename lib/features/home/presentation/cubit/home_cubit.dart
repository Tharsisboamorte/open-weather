import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';
import 'package:open_weather/core/res/media_res.dart';
import 'package:open_weather/features/home/domain/usecases/get_weather.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required GetWeather getWeather})
      : _getWeather = getWeather,
        super(const HomeInitial());

  final GetWeather _getWeather;


  String getIcon(String weatherDescription){
    switch(weatherDescription){
      case 'clear sky':
        return MediaRes.clearSky;
      case 'few clouds':
        return MediaRes.fewClouds;
      case 'scattered clouds':
        return MediaRes.fewClouds;
      case 'broken clouds':
        return MediaRes.overcast;
      case 'shower rain':
        return MediaRes.showers;
      case 'rain':
        return MediaRes.rain;
      case 'thunderstorm':
        return MediaRes.storm;
      case 'snow':
        return MediaRes.snow;
      default:
        return MediaRes.fog;
    }
  }


  Future<void> getWeather() async {
    emit(const LoadingInfo());
    final logger = Logger();

    final userPosition = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
    );

    final result = await _getWeather.call(
      GetWeatherParams(
        latitude: userPosition.latitude,
        longitude: userPosition.longitude,
      ),
    );

    result.fold(
      (failure) {
        logger
          ..d(failure.message)
          ..d(failure.statusCode);
      },
      (weather) {
        logger.i(weather.main);
        emit(
          LoadedWeather(
            feelsLike: weather.main.feelsLike.toString(),
            temperature: weather.main.temp.toString(),
            weatherDescription: weather.weather.description,
            weatherMain: weather.weather.main,
          ),
        );
      },
    );
  }
}
