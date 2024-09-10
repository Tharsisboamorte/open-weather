import 'package:equatable/equatable.dart';

class Wind extends Equatable {
  const Wind({
    required this.speed,
    required this.deg,
  });

  final double speed;
  final int deg;

  @override
  List<Object?> get props => [speed, deg];

  @override
  String toString() => 'Wind{speed: $speed, deg: $deg,}';
}
