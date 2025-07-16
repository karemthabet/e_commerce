import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/home/data/models/categories_or_brand_model.dart';

abstract class CategoryRepo {
Future<Either<Failure, List<CategoryDataOrBrands>>>fetchCategory();

}