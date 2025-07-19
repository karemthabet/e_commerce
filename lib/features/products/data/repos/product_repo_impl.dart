import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/cache/hive_product_services.dart';
import 'package:e_commerce/core/errors/exception.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/services/api_service.dart';
import 'package:e_commerce/core/utils/constants/end_points.dart';
import 'package:e_commerce/features/products/data/models/data_model.dart';
import 'package:e_commerce/features/products/data/repos/product_repo.dart';

class ProductRepoImpl extends ProductRepo {
  final ApiService apiService;
  final ProductsHiveService hiveService;

  ProductRepoImpl({required this.apiService, required this.hiveService});
  @override
  Future<Either<Failure, List<Data>>> fetchProducts() async {
    try {
      // ✅ 1) Check cached products first
      final cachedProducts = hiveService.getCachedProducts();
      if (cachedProducts.isNotEmpty) {
        return right(cachedProducts); // ✅ Immediately return cached data
      }

      // ✅ 2) If no cached data → fetch from API
      final map = await apiService.get(EndPoints.products);
      final dataList =
          (map['data'] as List).map((e) => Data.fromJson(e)).toList();

      // ✅ 3) Save fresh data to cache
      await hiveService.cacheProducts(dataList);

      return right(dataList); // ✅ Return fresh data
    } on CustomException catch (e) {
      // ✅ 4) If API fails & no cache
      return left(ServerFailure(errMessage: e.message));
    }
  }
}
