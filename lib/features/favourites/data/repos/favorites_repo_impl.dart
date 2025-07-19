import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/cache/hive_product_services.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/services/api_service.dart';
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

  @override
  Future<Either<Failure, List<Data>>> addToFavorites({required Data product}) {
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, List<Data>>> removeAllFavorites() {
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, List<Data>>> removeFromFavorites({required Data product}) {
    throw UnimplementedError();
  }

// update the favorite status in the Local Storage Hive
  @override
  Future<Either<Failure, String>> updateProductAttributeById(
      {required String productId, required String attribute, bool newValue = false}) {
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
