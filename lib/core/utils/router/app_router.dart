
import 'package:e_commerce/core/utils/router/routes_name.dart';
import 'package:e_commerce/features/onBording/presentation/pages/on_bording_page.dart';
import 'package:e_commerce/features/splash/presentation/pages/splash_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router=GoRouter(

    routes: [
      GoRoute(
        path: RoutesName.splash,
        builder: (context, state) {
          return const SplashPage();
        },
      ),
      GoRoute(
        path: RoutesName.onBoarding,
        builder: (context, state) {
          return const OnBordingPage();
        },
      ),
    ],
  );
}