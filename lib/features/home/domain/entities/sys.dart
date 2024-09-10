import 'package:equatable/equatable.dart';

class Sys extends Equatable {
  const Sys({
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  final String country;
  final int sunrise;
  final int sunset;

  @override
  List<Object?> get props => [country, sunrise, sunset];

  @override
  String toString() =>
      'Sys{country: $country, sunrise: $sunrise, sunset: $sunset}';
}
