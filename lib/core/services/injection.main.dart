part of 'injection.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _initAuth();
}

Future<void> _initAuth() async {
  sl
  .registerFactory(AuthCubit.new);
}
