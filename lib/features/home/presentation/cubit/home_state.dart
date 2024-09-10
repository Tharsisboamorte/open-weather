part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {
  const HomeInitial();
}

final class LoadingInfo extends HomeState {
  const LoadingInfo();
}

final class LoadedWeather extends HomeState {
  const LoadedWeather({
    required this.weatherMain,
    required this.weatherDescription,
    required this.temperature,
    required this.feelsLike,
  });

  final String weatherMain;
  final String weatherDescription;
  final String temperature;
  final String feelsLike;

  @override
  List<Object> get props => [
        weatherDescription,
        weatherMain,
        temperature,
        feelsLike,
      ];
}
