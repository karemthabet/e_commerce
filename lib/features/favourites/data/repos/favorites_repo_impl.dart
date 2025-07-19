import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/cache/hive_product_services.dart';
import 'package:e_commerce/core/cache/prefs.dart';
import 'package:e_commerce/core/errors/exception.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/services/api_service.dart';
import 'package:e_commerce/core/services/setup_service_locator.dart';
import 'package:e_commerce/core/utils/constants/app_constants.dart';
import 'package:e_commerce/core/utils/constants/end_points.dart';
import 'package:e_commerce/features/favourites/data/repos/favorites_repo.dart';
import 'package:e_commerce/features/products/data/models/data_model.dart';

class FavoritesRepoImpl implements FavoritesRepo {
  final ApiService apiService;
  final ProductsHiveService hiveService;

  FavoritesRepoImpl({required this.apiService, required this.hiveService});

  /// ************************ LOCALLY *****************************************

  // get all favorites
  @override
  Future<Either<Failure, List<Data>>> getFavorites() {
    try {
      List<Data> cachedFavorites = hiveService.getFavoriteProducts();
      return Future.value(Right(cachedFavorites));
    } on Exception catch (e) {
      return Future.value(
        Left(
          ServerFailure(
            errMessage: e.toString(),
          ),
        ),
      );
    }
  }

// update the favorite status in the Local Storage Hive
  @override
  Future<Either<Failure, String>> updateProductAttributeById(
      {required String productId,
      required String attribute,
      bool newValue = false}) {
    try {
      hiveService.updateProductAttributeById(
        productId: productId,
        attribute: "isFavorite",
        newValue: newValue,
      );
      return Future.value(const Right("Success"));
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(errMessage: e.toString())));
    }
  }

  @override
  Future<Either<Failure, String>> addToFavorites(
      {required String productId}) async {
    final token = Prefs.getString(AppConstants.kToken);
    try {
      final response = await apiService.post(EndPoints.postFavorite, data: {
        "productId": productId,
      }, headers: {
       // "Authorization": "Bearer $token", // if API requires Bearer
          "token": token,  
      });

      log(" Wishlist Response: $response");

      return const Right("success");
    } on CustomException catch (e) {
      return Left(ServerFailure(errMessage: e.message));
    }
  }

  @override
  Future<Either<Failure, List<Data>>> removeAllFavorites() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> removeFromFavorites(
      {required String productId}) async {
    final token = Prefs.getString(AppConstants.kToken);

    try {
      final response = await getIt
          .get<ApiService>()
          .delete("/wishlist/$productId", headers: {
       // "Authorization": "Bearer $token", //if API requires Bearer
        "token": token,  
      });
      log("Deleted successfully: $response");
      return const Right("success");
    } on CustomException catch (e) {
      return Left(ServerFailure(errMessage: e.message));
    }
  }

  /*

  // add to favorites
  @override
  Future<Either<Failure, List<Data>>> addToFavorites(
      {required Data product}) async {
    try {
      await hiveService.cacheFavorites(product);
      final newwFavorites = hiveService.getCachedFavorites();
      return Right(newwFavorites);
    } on Exception catch (e) {
      return Future.value(
        Left(
          ServerFailure(
            errMessage: e.toString(),
          ),
        ),
      );
    }
  }
*/
/*
  // remove from favorites
  @override
  Future<Either<Failure, List<Data>>> removeFromFavorites(
      {required Data product}) async {
    try {
      await hiveService.removeFromFavorites(product);
      final newwFavorites = hiveService.getCachedFavorites();

      return Right(newwFavorites);
    } on Exception catch (e) {
      return Future.value(
        Left(
          ServerFailure(
            errMessage: e.toString(),
          ),
        ),
      );
    }
  }

  */
/*
  // remove all favorites
  @override
  Future<Either<Failure, List<Data>>> removeAllFavorites() async {
    try {
      await hiveService.removeAllFavorites();
      final newwFavorites = hiveService.getCachedFavorites();

      return Right(newwFavorites);
    } on Exception catch (e) {
      return Future.value(
        Left(
          ServerFailure(
            errMessage: e.toString(),
          ),
        ),
      );
    }
  }
*/
}
