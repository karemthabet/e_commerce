import 'package:dio/dio.dart';
import 'package:e_commerce/core/cashed/brand_service.dart';
import 'package:e_commerce/core/cashed/category_service.dart';
import 'package:e_commerce/core/cashed/hive_product_services.dart';
import 'package:e_commerce/features/auth/data/repos/auth_repo.dart';
import 'package:e_commerce/features/auth/data/repos/auth_repo_impl.dart';
import 'package:e_commerce/features/home/data/repos/brand_repo.dart';
import 'package:e_commerce/features/home/data/repos/brand_repo_impl.dart';
import 'package:e_commerce/features/home/data/repos/category_repo.dart';
import 'package:e_commerce/features/home/data/repos/category_repo_impl.dart';
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
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<ApiService>(DioConsumer(dio: getIt<Dio>()));
  getIt.registerLazySingleton<ProductsHiveService>(() => ProductsHiveService());
  getIt.registerLazySingleton<CategoryHiveService>(
      () => CategoryHiveService());

  getIt.registerLazySingleton<CategoryRepo>(() => CategoryRepoImpl(
      apiService: getIt.get<ApiService>(),
      hiveService: getIt.get<CategoryHiveService>()));

  getIt.registerLazySingleton<BrandRepo>(() => BrandRepoImpl(
      apiService: getIt.get<ApiService>(),
      hiveService: getIt.get<BrandHiveService>()));
  getIt.registerLazySingleton<ProductRepo>(() => ProductRepoImpl(
      apiService: getIt.get<ApiService>(),
      hiveService: getIt.get<ProductsHiveService>()));
  getIt.registerFactory(() => ProductsCubit(getIt.get<ProductRepo>()));

  getIt.registerFactory(() => CategoryCubit(getIt.get<CategoryRepo>()));
  getIt.registerFactory(() => BrandCubit(getIt.get<BrandRepo>()));
  getIt.registerLazySingleton<BrandHiveService>(()=>BrandHiveService());

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(apiService: getIt<ApiService>()),
  );
}
