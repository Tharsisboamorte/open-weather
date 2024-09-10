
import 'package:open_weather/core/utils/typedef.dart';
import 'package:open_weather/features/home/domain/entities/wind.dart';

class WindModel extends Wind {
  const WindModel({
    required super.speed,
    required super.deg,
  });

  factory WindModel.fromJson(DataMap? source) => WindModel(
        speed: source?['speed'] as double,
        deg: source?['deg'] as int,
      );

  WindModel.fromMap(DataMap map)
      : this(
          deg: map['deg'] as int,
          speed: map['speed'] as double,
        );
}
