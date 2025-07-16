import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/cashed/category_or_brans_service.dart';
import 'package:e_commerce/core/errors/exception.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/services/api_service.dart';
import 'package:e_commerce/core/utils/constants/end_points.dart';
import 'package:e_commerce/features/home/data/models/categories_or_brand_model.dart';
import 'package:e_commerce/features/home/data/repos/category_repo.dart';

class CategoryRepoImpl  extends CategoryRepo{
    final ApiService apiService;
    final CategoryOrBrandHiveService hiveService;

  CategoryRepoImpl( {required this.apiService,required this.hiveService,});

  @override
  Future<Either<Failure, List<CategoryDataOrBrands>>> fetchCategory() async{


try {
      final map = await apiService.get(EndPoints.categories);

      final dataList = (map['data'] as List)
          .map((e) => CategoryDataOrBrands.fromJson(e))
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