import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';


abstract class FavoritesRepo {
  Future<Either<Failure,String>>updateProductAttributeById({String? productId,String? attribute,bool? newValue});
}