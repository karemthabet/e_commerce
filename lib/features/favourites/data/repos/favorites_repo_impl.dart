import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/cache/hive_product_services.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/services/api_service.dart';
import 'package:e_commerce/features/favourites/data/repos/favorites_repo.dart';

class FavoritesRepoImpl extends FavoritesRepo {
  final ApiService apiService;
  final ProductsHiveService hiveService;

  FavoritesRepoImpl({required this.apiService, required this.hiveService});

  @override
  Future<Either<Failure, String>> updateProductAttributeById(
      {String? productId, String? attribute, bool? newValue}) {
        
    try {
  hiveService.updateProductAttributeById(
    productId: productId!,
    attribute: "isFavorite",
    newValue: newValue,
  );
    return Future.value(const Right("isFavorite updated successfully"));


} on Exception catch (e) {
  return Future.value(Left(ServerFailure( errMessage: e.toString())));
}

  }
}
