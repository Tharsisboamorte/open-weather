import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:open_weather/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:open_weather/features/home/data/datasources/home_data_sources.dart';
import 'package:open_weather/features/home/data/repos/home_repo_impl.dart';
import 'package:open_weather/features/home/domain/repository/home_repo.dart';
import 'package:open_weather/features/home/domain/usecases/get_weather.dart';
import 'package:open_weather/features/home/presentation/cubit/home_cubit.dart';

part 'injection.main.dart';

