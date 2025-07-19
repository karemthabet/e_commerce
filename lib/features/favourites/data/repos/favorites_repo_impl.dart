import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/cache/hive_product_services.dart';
import 'package:e_commerce/core/cache/prefs.dart';
import 'package:e_commerce/core/errors/exception.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/services/api_service.dart';
import 'package:e_commerce/core/utils/constants/app_constants.dart';
import 'package:e_commerce/core/utils/constants/end_points.dart';
import 'package:e_commerce/features/favourites/data/repos/favorites_repo.dart';
import 'package:e_commerce/features/products/data/models/data_model.dart';

class FavoritesRepoImpl implements FavoritesRepo {
  final ApiService apiService;
  final ProductsHiveService hiveService;
  late final token;
  FavoritesRepoImpl({required this.apiService, required this.hiveService}) {
    token = Prefs.getString(AppConstants.kToken);
  }

  // get all favorites
  @override
  Future<Either<Failure, List<Data>>> getFavorites() async {
    try {
      //  step 1- Check local cache first
      List<Data> cachedFavorites = hiveService.getFavoriteProducts();
      if (cachedFavorites.isNotEmpty) {
        return Right(cachedFavorites);
      }

      // step 2-  Fetch from API if local cache is empty
      final response = await apiService.get(
        "/wishlist",
        headers: {"token": token},
      );

      log("API Fetched Favorites: ${response.toString()}");

//  Step 3 - Parse API data directly into Data objects
      final apiFavorites = (response["data"] as List)
          .map<Data>((e) => Data.fromJson(e))
          .toList();

//  Step 4 - Cache favorites locally for offline use
      await hiveService.cacheFavorites(apiFavorites);
      await hiveService.updateFetchedIsFavorite(fetchedFavorites: apiFavorites);

// final res
      return Right(apiFavorites);
    } on CustomException catch (e) {
      return Left(ServerFailure(errMessage: e.message));
    } catch (e, s) {
      log(" getFavorites Error: $e\n$s");
      return Left(ServerFailure(errMessage: e.toString()));
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
    // final token = Prefs.getString(AppConstants.kToken);
    try {
      final response = await apiService.post(EndPoints.favorite, data: {
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
  Future<Either<Failure, String>> removeFromFavorites(
      {required String productId}) async {
//    final token = Prefs.getString(AppConstants.kToken);

    try {
      final response =
          await apiService.delete("${EndPoints.favorite}/$productId", headers: {
        // "Authorization": "Bearer $token", //if API requires Bearer
        "token": token,
      });
      log("Deleted successfully: $response");
      return const Right("success");
    } on CustomException catch (e) {
      return Left(ServerFailure(errMessage: e.message));
    }
  }

  @override
  Future<Either<Failure, String>> removeAllFavorites() async {
    try {
      final response = await apiService.delete(
        EndPoints.favorite,
        headers: {
          "token": token,
        },
      );
      log(response);
      return const Right("success");
    } on CustomException catch (e) {
      return Left(ServerFailure(errMessage: e.message));
    }
  }

/*
// Alternative method to clear all wishlist items
// This method fetches all wishlist items and deletes them one by one
Future<void> clearAllWishlist() async {
  // 1) Get all wishlist items first
  final wishlistResponse = await getIt.get<ApiService>().get(
    "/wishlist",
    headers: {
      "token": token,
    },
  );

  List<dynamic> wishlist = wishlistResponse["data"]; 

  // 2) Loop through and delete each item
  for (var item in wishlist) {
    String wishlistItemId = item["_id"]; // make sure this is correct key

    await getIt.get<ApiService>().delete(
      "/wishlist/$wishlistItemId",
      headers: {
        "token": token,
      },
    );
  }

  log("All wishlist items deleted!");
}

*/
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
