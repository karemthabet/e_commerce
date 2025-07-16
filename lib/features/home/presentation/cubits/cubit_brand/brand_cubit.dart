import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/home/data/models/categories_or_brand_model.dart';
import 'package:e_commerce/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'brand_state.dart';

class BrandCubit extends Cubit<BrandState> {
 BrandCubit(this.repo) : super(BrandInitial());
final HomeRepo repo;

Future<void>getAllBrands()async{
emit(BrandLoading());
final data=await repo.fetchBrand();
data.fold((fail)=>emit(BrandFailure(errorMessage: fail.errMessage)), (data)=>emit(BrandSuccess(data)));
}
}

