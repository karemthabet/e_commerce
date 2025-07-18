import 'package:e_commerce/core/utils/router/routes_name.dart';
import 'package:e_commerce/features/app/presentation/pages/main_page.dart';
import 'package:e_commerce/features/auth/presentation/pages/create_account_page.dart';
import 'package:e_commerce/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:e_commerce/features/auth/presentation/pages/login_page.dart';
import 'package:e_commerce/features/auth/presentation/pages/reset_password_page.dart';
import 'package:e_commerce/features/auth/presentation/pages/verification_code_page.dart';
import 'package:e_commerce/features/favourites/presentation/pages/favorites_page.dart';
import 'package:e_commerce/features/home/presentation/Pages/home_page.dart';
import 'package:e_commerce/features/onBording/presentation/pages/on_bording_page.dart';
import 'package:e_commerce/features/products/data/models/product_model.dart';
import 'package:e_commerce/features/products/presentation/pages/product_details_view.dart';
import 'package:e_commerce/features/splash/presentation/pages/splash_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      // Splash Screen
      GoRoute(
        path: RoutesName.splash,
        builder: (context, state) => const SplashPage(),
      ),

      // Onboarding Screen
      GoRoute(
        path: RoutesName.onBoarding,
        builder: (context, state) => const OnBordingPage(),
      ),

      //  Create Account Screen
      GoRoute(
        name: RoutesName.createAnAccount,
        path: RoutesName.createAnAccount,
        builder: (context, state) => const CreateAccountPage(),
      ),

      // Login Screen
      GoRoute(
        name: RoutesName.login,
        path: RoutesName.login,
        builder: (context, state) => const LoginPage(),
      ),

      // Verification Code Screen
      GoRoute(
        name: RoutesName.verficationCode,
        path: RoutesName.verficationCode,
        builder: (context, state) => const VerificationCodePage(),
      ),

      // Forgot Password Screen
      GoRoute(
        name: RoutesName.forgotPassword,
        path: RoutesName.forgotPassword,
        builder: (context, state) => const ForgotPasswordPage(),
      ),

      // Reset Password Screen
      GoRoute(
        name: RoutesName.resetPassword,
        path: RoutesName.resetPassword,
        builder: (context, state) => const ResetPasswordPage(),
      ),

      // Main Page
      GoRoute(
        name: RoutesName.mainPage,
        path: RoutesName.mainPage,
        builder: (context, state) => const MainPage(),
      ),

      // Home Screen
      GoRoute(
        name: RoutesName.home,
        path: RoutesName.home,
        builder: (context, state) => const HomePage(),
      ),
      // Product Details Screen
      GoRoute(
        path: RoutesName.productDetails,
        name: RoutesName.productDetails,
        builder: (context, state) {
          final product = state.extra as Data;
          return ProductDetailsView(
            product: product,
          );
        },
      ),

      // Favorites Screen
      GoRoute(
        name: RoutesName.favorites,
        path: RoutesName.favorites,
        builder: (context, state) => const FavoritesPage(),
      ),
    ],
  );
}
