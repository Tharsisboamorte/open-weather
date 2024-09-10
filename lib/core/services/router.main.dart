part of 'router.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return _pageBuilder(
        (context) {
          return BlocProvider(
            create: (_) => sl<AuthCubit>(),
            child: const AuthScreen(),
          );
        },
        settings: settings,
      );
    case '/home':
      return _pageBuilder(
        (context) {
          return BlocProvider(
            create: (_) => sl<HomeCubit>(),
            child: const HomeScreen(),
          );
        },
        settings: settings,
      );
    default:
      return _pageBuilder(
        (_) => const Scaffold(),
        settings: settings,
      );
  }
}

PageRouteBuilder<dynamic> _pageBuilder(
  Widget Function(BuildContext) page, {
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    settings: settings,
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
    pageBuilder: (context, _, __) => page(context),
  );
}
