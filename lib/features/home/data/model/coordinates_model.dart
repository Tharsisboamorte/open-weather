
import 'package:logger/logger.dart';
import 'package:open_weather/core/utils/typedef.dart';
import 'package:open_weather/features/home/domain/entities/coordinates.dart';

class CoordinatesModel extends Coordinates {
  const CoordinatesModel({
    required super. longitude,
    required super.latitude,
  });

  factory CoordinatesModel.fromJson(DataMap? source) {
    Logger().i(source);
    return CoordinatesModel(
      longitude: source?['lon'] as double,
      latitude: source?['lat'] as double,
    );
  }
}
