import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/products/data/models/product_model.dart';
import 'package:e_commerce/features/products/data/repos/product_repo.dart';
import 'package:equatable/equatable.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productRepo) : super(ProductsInitial());
  ProductRepo productRepo;
  Future<void> getProducts() async {
    final result = await productRepo.fetchProducts();
    result.fold((fail) => emit(ProductsFailure(errorMessage: fail.errMessage)),
        (products) => emit(ProductsSuccess(products)));
  }
}
