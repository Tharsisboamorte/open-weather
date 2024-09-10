import 'package:equatable/equatable.dart';

class Coordinates extends Equatable {
  const Coordinates({
    required this.longitude,
    required this.latitude,
  });

  final double? longitude;
  final double? latitude;

  @override
  List<Object?> get props => [longitude, latitude];

  @override
  String toString() =>
      'Coordinates{longitude: $longitude, latitude: $latitude}';
}
