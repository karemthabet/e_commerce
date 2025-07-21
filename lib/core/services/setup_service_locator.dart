import 'package:dio/dio.dart';
import 'package:e_commerce/core/cache/brand_service.dart';
import 'package:e_commerce/core/cache/category_service.dart';
import 'package:e_commerce/core/cache/hive_favorites_services.dart';
import 'package:e_commerce/core/cache/hive_product_services.dart';
import 'package:e_commerce/features/auth/data/repos/auth_repo.dart';
import 'package:e_commerce/features/auth/data/repos/auth_repo_impl.dart';
import 'package:e_commerce/features/changepassword/presentation/cubit/changepassword_cubit.dart';
import 'package:e_commerce/features/favourites/data/repos/favorites_repo.dart';
import 'package:e_commerce/features/favourites/data/repos/favorites_repo_impl.dart';
import 'package:e_commerce/features/favourites/presentation/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:e_commerce/features/home/data/repos/home_repo.dart';
import 'package:e_commerce/features/home/data/repos/home_repo_impl.dart';
import 'package:e_commerce/features/home/presentation/cubits/cubit_brand/brand_cubit.dart';
import 'package:e_commerce/features/home/presentation/cubits/cubit_category/category_cubit.dart';
import 'package:e_commerce/features/products/data/repos/product_repo.dart';
import 'package:e_commerce/features/products/data/repos/product_repo_impl.dart';
import 'package:e_commerce/features/products/presentation/cubits/product_cubit/products_cubit.dart';
import 'package:get_it/get_it.dart';

import 'api_service.dart';
import 'dio_consumer.dart';
  final getIt = GetIt.instance;

void setupServiceLocator() {
  // Core services
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<ApiService>(DioConsumer(dio: getIt<Dio>()));

  // Hive services
  getIt.registerLazySingleton<ProductsHiveService>(() => ProductsHiveService());
  getIt.registerLazySingleton<CategoryHiveService>(() => CategoryHiveService());
  getIt.registerLazySingleton<BrandHiveService>(() => BrandHiveService());
  getIt.registerLazySingleton<FavoritesHiveService>(() => FavoritesHiveService()); // ✅ ADD THIS

  // Repositories
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(
        apiService: getIt.get<ApiService>(),
        hiveCategoryService: getIt.get<CategoryHiveService>(),
        hiveBrandService: getIt.get<BrandHiveService>(),
      ));

  getIt.registerLazySingleton<ProductRepo>(() => ProductRepoImpl(
        apiService: getIt.get<ApiService>(),
        hiveService: getIt.get<ProductsHiveService>(),
      ));

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerLazySingleton<FavoritesRepo>(() => FavoritesRepoImpl(
        apiService: getIt<ApiService>(),
        hiveService: getIt<ProductsHiveService>(),
      ));

  // Cubits
  getIt.registerFactory(() => ProductsCubit(getIt.get<ProductRepo>()));
  getIt.registerFactory(() => CategoryCubit(getIt.get<HomeRepo>()));
  getIt.registerFactory(() => BrandCubit(getIt.get<HomeRepo>()));
  getIt.registerFactory(() => FavoritesCubit(getIt.get<FavoritesRepo>()));
  getIt.registerFactory(() => ChangePasswordCubit(getIt.get<AuthRepo>()));
}
