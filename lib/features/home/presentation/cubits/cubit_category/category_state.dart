part of 'category_cubit.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}
final class CategoryLoading extends CategoryState {}
final class CategorySuccess extends CategoryState {
  final  List<CategoryDataOrBrands>categories;

  const CategorySuccess(this.categories);
   @override
  List<Object> get props => [categories];

}
final class CategoryFailure extends CategoryState {
  final String errorMessage;
     @override

    List<Object> get props => [errorMessage];


  const CategoryFailure({required this.errorMessage});
}
