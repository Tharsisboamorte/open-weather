import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_weather/core/extensions/media_query_values.dart';
import 'package:open_weather/core/res/typography.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    required this.temperature,
    required this.weather,
    required this.icon,
    required this.feelsLike,
    super.key,
  });

  final String temperature;
  final String feelsLike;
  final String weather;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * .5,
      width: context.width * .5,
      child: Card(
        child: Column(
          children: [
            SizedBox(
              height: context.height * .05,
            ),
            Text(
              'Current Weather',
              style: AppTextStyle.instance.h1SemiBold,
            ),
            SizedBox(
              height: context.height * .03,
            ),
            SizedBox(
              height: context.height * .2,
              width: context.width * .2,
              child: SvgPicture.asset(icon),
            ),
            SizedBox(
              height: context.height * .03,
            ),
            Text(
              weather,
              style: AppTextStyle.instance.h1SemiBold,
            ),
            Text(
              '$temperatureº',
              style: AppTextStyle.instance.body1Regular,
            ),
            Text(
              'RealFeel: $feelsLike',
              style: AppTextStyle.instance.h1SemiBold,
            ),
          ],
        ),
      ),
    );
  }
}
