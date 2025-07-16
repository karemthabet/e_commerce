part of 'brand_cubit.dart';

sealed class BrandState extends Equatable {
  const BrandState();

  @override
  List<Object> get props => [];
}

final class BrandInitial extends BrandState {}
final class BrandLoading extends BrandState {}
final class BrandSuccess extends BrandState {
  final List<CategoryDataOrBrands>brands;

  const BrandSuccess(this.brands);
    @override
    List<Object> get props => [brands];

}
final class BrandFailure extends BrandState {
  final String errorMessage;
    @override
    List<Object> get props => [errorMessage];


  const BrandFailure({required this.errorMessage});
}
