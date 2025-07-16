import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/cache/hive_product_services.dart';
import 'package:e_commerce/core/errors/exception.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/services/api_service.dart';
import 'package:e_commerce/core/utils/constants/end_points.dart';
import 'package:e_commerce/features/products/data/models/product_model.dart';
import 'package:e_commerce/features/products/data/repos/product_repo.dart';

class ProductRepoImpl extends ProductRepo {
  final ApiService apiService;
  final ProductsHiveService hiveService;

  ProductRepoImpl({required this.apiService, required this.hiveService});

  @override
  Future<Either<Failure, List<Data>>> fetchProducts() async {
    try {
      final map = await apiService.get(EndPoints.products);

      final dataList = (map['data'] as List)
          .map((e) => Data.fromJson(e))
          .toList();

      await hiveService.cacheProducts(dataList);

      return right(dataList);
    } on CustomException catch (e) {
      final cached = hiveService.getCachedProducts();

      if (cached.isNotEmpty) {
        return right(cached);
      }

      return left(ServerFailure(errMessage: e.message));
    }
  }
}
