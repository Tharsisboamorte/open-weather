import 'package:open_weather/core/utils/typedef.dart';
import 'package:open_weather/features/home/domain/entities/sys.dart';

class SysModel extends Sys {
  const SysModel({
    required super.country,
    required super.sunrise,
    required super.sunset,
  });

  factory SysModel.fromJson(DataMap source) => SysModel(
        country: source['country'] as String,
        sunrise: source['sunrise'] as int,
        sunset: source['sunset'] as int,
      );
}
