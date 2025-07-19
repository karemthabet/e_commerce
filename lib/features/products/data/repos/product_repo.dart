import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/products/data/models/data_model.dart';


abstract class ProductRepo {
  Future<Either<Failure,List<Data>>>fetchProducts();
}