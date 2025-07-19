import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/products/data/models/product_model.dart';

abstract class FavoritesRepo {
  /// ************************ LOCALLY *****************************************

  // add to favorites LIST
   Future<Either<Failure, List<Data>>> addToFavorites({required Data product});
  // remove from favorites LIST
 Future<Either<Failure, List<Data>>> removeFromFavorites({required Data product});
  // remove all favorites
 Future<Either<Failure, List<Data>>> removeAllFavorites();
  // get all favorites
  Future<Either<Failure, List<Data>>> getFavorites();
  //update ITEM atrribute
  Future<Either<Failure, String>> updateProductAttributeById(
      {required String productId, required String attribute, bool newValue});



/// ************************ REMOTELY *****************************************
  
}
