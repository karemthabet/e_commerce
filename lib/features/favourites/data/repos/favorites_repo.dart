import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/products/data/models/data_model.dart';

abstract class FavoritesRepo {

  // add to favorites LIST
  Future<Either<Failure, String>> addToFavorites({required String productId});
  // remove from favorites LIST
 Future<Either<Failure, String>> removeFromFavorites({required String productId});
  // remove all favorites
 Future<Either<Failure, String>> removeAllFavorites();
  // get all favorites
  Future<Either<Failure, List<Data>>> getFavorites();
  //update ITEM atrribute
  Future<Either<Failure, String>> updateProductAttributeById(
      {required String productId, required String attribute, bool newValue});



  
}
