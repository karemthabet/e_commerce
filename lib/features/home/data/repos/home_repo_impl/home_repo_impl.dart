import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/cashed/brand_service.dart';
import 'package:e_commerce/core/cashed/category_service.dart';
import 'package:e_commerce/core/errors/exception.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/services/api_service.dart';
import 'package:e_commerce/core/utils/constants/end_points.dart';
import 'package:e_commerce/features/home/data/models/categories_or_brand_model.dart';
import 'package:e_commerce/features/home/data/repos/home_repo/home_repo.dart';

class HomeRepoImpl  extends HomeRepo{
      final ApiService apiService;
    final BrandHiveService hiveBrandService;
   final CategoryHiveService hiveCategoryService;


  HomeRepoImpl({required this.apiService,required this.hiveBrandService,  required this.hiveCategoryService, });

  @override
  Future<Either<Failure, List<CategoryDataOrBrands>>> fetchBrand()async {

try {
      final map = await apiService.get(EndPoints.brands);

      final dataList = (map['data'] as List)
          .map((e) => CategoryDataOrBrands.fromJson(e))
          .toList();

      await hiveBrandService.casheBrand(dataList);

      return right(dataList);
    } on CustomException catch (e) {
      final cached = hiveBrandService.getCashedBrands();

      if (cached.isNotEmpty) {
        return right(cached);
      }

      return left(ServerFailure(errMessage: e.message));
    }
  }
    Future<Either<Failure, List<CategoryDataOrBrands>>> fetchCategory() async{


try {
      final map = await apiService.get(EndPoints.categories);

      final dataList = (map['data'] as List)
          .map((e) => CategoryDataOrBrands.fromJson(e))
          .toList();

      await hiveCategoryService.cacheCategory(dataList);

      return right(dataList);
    } on CustomException catch (e) {
      final cached = hiveCategoryService.getCachedCategory();

      if (cached.isNotEmpty) {
        return right(cached);
      }

      return left(ServerFailure(errMessage: e.message));
    }
  }
}