import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/home/data/models/categories_or_brand_model.dart';
import 'package:e_commerce/features/home/data/repos/home_repo/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.repo) : super(CategoryInitial());
final HomeRepo repo;

Future<void>getAllCategories()async{
emit(CategoryLoading());
final data=await repo.fetchCategory();
 data.fold((fail)=>emit(CategoryFailure(errorMessage: fail.errMessage)), (data)=>emit(CategorySuccess(data)));
}
}
