import 'package:e_commerce/core/utils/router/routes_name.dart';
import 'package:e_commerce/features/auth/presentation/pages/create_account_page.dart';
import 'package:e_commerce/features/auth/presentation/pages/login_page.dart';
import 'package:e_commerce/features/home/presentation/Pages/home_page.dart';
import 'package:e_commerce/features/onBording/presentation/pages/on_bording_page.dart';
import 'package:e_commerce/features/splash/presentation/pages/splash_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: RoutesName.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: RoutesName.onBoarding,
        builder: (context, state) => const OnBordingPage(),
      ),
      GoRoute(
        name: RoutesName.login,
        path: RoutesName.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        name: RoutesName.createAnAccount,
        path: RoutesName.createAnAccount,
        builder: (context, state) => const CreateAccountPage(),
      ),
      GoRoute(
        path: RoutesName.home,
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
}
