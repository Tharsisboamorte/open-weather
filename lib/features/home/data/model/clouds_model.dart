
import 'package:open_weather/core/utils/typedef.dart';
import 'package:open_weather/features/home/domain/entities/clouds.dart';

class CloudsModel extends Clouds {
  const CloudsModel({required super.all});

  factory CloudsModel.fromJson(DataMap source) =>
      CloudsModel(all: source['all'] as int);

  CloudsModel.fromMap(DataMap map)
      : this(
          all: map['all'] as int,
        );
}
