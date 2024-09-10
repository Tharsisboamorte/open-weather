import 'package:flutter/material.dart';
import 'package:open_weather/core/extensions/media_query_values.dart';

class LoadingCard extends StatelessWidget {
  const LoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * .5,
      width: context.width * .5,
      child: const Card(
        color: Colors.white,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
