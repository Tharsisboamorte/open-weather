import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_weather/features/home/presentation/cubit/home_cubit.dart';
import 'package:open_weather/features/home/presentation/widget/weather_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeCubit>().getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.blueGrey,
          body: state is LoadingInfo
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : state is LoadedWeather
                  ? Center(
                      child: WeatherCard(
                        temperature: state.temperature,
                        weather: state.weatherMain,
                        icon: cubit.getIcon(state.weatherDescription),
                        feelsLike: state.feelsLike,
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
        );
      },
    );
  }
}
