import 'package:e_commerce/core/services/setup_service_locator.dart';
import 'package:e_commerce/core/utils/router/routes_name.dart';
import 'package:e_commerce/features/auth/presentation/pages/create_account_page.dart';
import 'package:e_commerce/features/auth/presentation/pages/login_page.dart';
import 'package:e_commerce/features/home/presentation/Pages/home_page.dart';
import 'package:e_commerce/features/home/presentation/cubits/cubit_brand/brand_cubit.dart';
import 'package:e_commerce/features/home/presentation/cubits/cubit_category/category_cubit.dart';
import 'package:e_commerce/features/onBording/presentation/pages/on_bording_page.dart';
import 'package:e_commerce/features/products/data/models/product_model.dart';
import 'package:e_commerce/features/products/presentation/pages/product_details_view.dart';
import 'package:e_commerce/features/splash/presentation/pages/splash_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: RoutesName.splash,
        builder: (context, state) => const SplashPage(),
      ),
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
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  getIt.get<CategoryCubit>()..getAllCategories(),
            ),
            BlocProvider(
              create: (context) => getIt.get<BrandCubit>()..getAllBrands(),
            ),
          ],
          child: const HomePage(),
        ),
      ),
    ],
  );
}
