import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:open_weather/core/errors/execptions.dart';
import 'package:open_weather/core/utils/constants/api_constants.dart';
import 'package:open_weather/core/utils/typedef.dart';
import 'package:open_weather/features/home/data/model/weather_data_model.dart';

abstract class HomeDataSource {
  Future<WeatherDataModel> getWeather({
    required double latitude,
    required double longitude,
  });
}

class HomeDataSourceImpl implements HomeDataSource {
  const HomeDataSourceImpl(this._client);

  final http.Client _client;

  @override
  Future<WeatherDataModel> getWeather({
    required double latitude,
    required double longitude,
  }) async {
    final logger = Logger();

    try {
      final response = await _client.get(
        Uri.parse(ApiConstants.kWeatherEndpoint).replace(
          queryParameters: {
            'lat': latitude.toString(),
            'lon': longitude.toString(),
            'appid': ApiConstants.apiKey,
            'units': 'metric',
          },
        ),
      );

      // logger.i('${response.body} and ${response.statusCode}');

      if (response.statusCode != 200) {
        throw APIException(
          message: response.body,
          statusCode: response.statusCode,
        );
      }

      final jsonObject = jsonDecode(response.body);

      return WeatherDataModel.fromJson(jsonObject);
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }
}
