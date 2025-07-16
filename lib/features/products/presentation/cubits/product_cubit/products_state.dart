part of 'products_cubit.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

final class ProductsInitial extends ProductsState {}
final class ProductsLaoding extends ProductsState {}
final class ProductsSuccess extends ProductsState {
  final List<Data>products;

  const ProductsSuccess(this.products);
}
final class ProductsFailure extends ProductsState {

  final String errorMessage;

  const ProductsFailure({required this.errorMessage});
}
