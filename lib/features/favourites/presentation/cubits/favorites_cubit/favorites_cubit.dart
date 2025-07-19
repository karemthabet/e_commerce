
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/favourites/data/repos/favorites_repo.dart';
import 'package:e_commerce/features/products/data/models/data_model.dart';
part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesRepo favoritesRepo;
  FavoritesCubit(this.favoritesRepo) : super(FavoritesInitial());
  //static List<Data> favoritesItems = [];

  void updateFavoritesHeart(Data product) {
    product.isFavorite = !product.isFavorite!;
    emit(UpdateFavoritesHeartSuccessState());
  }
updateIsFavoriteAttribute(
      String productId, bool newValue) async {
    final result = await favoritesRepo.updateProductAttributeById(
      productId: productId,
      attribute: "isFavorite",
      newValue: newValue,
    );
    result.fold(
      (failure) => emit(UpdateFavoritesHeartFailureState(failure.errMessage)),
      (success) => emit(UpdateIsFavoriteAttributeSuccessState(success)),
    );
  }

  getFavorites() async {
    emit(FavoritesLoadingState());
    final result = await favoritesRepo.getFavorites();
    result.fold((failure) => emit(GetFavoritesFailureState(failure.errMessage)),
        (success) => emit(GetFavoritesSuccessState(success)));
  }

  addToFav(String productId) async {
    emit(FavoritesLoadingState());
    final result = await favoritesRepo.addToFavorites(productId : productId);
    result.fold(
      (failure) => emit(AddToFavoritesFailureState(failure.errMessage)),
      (success) => emit(AddToFavoritesSuccessState()),
    );
  }

  deleteFromFav(String productId) async {
    emit(FavoritesLoadingState());
    final result = await favoritesRepo.removeFromFavorites(productId:  productId);
    result.fold(
        (failure) => emit(DeleteFromFavoritesFailureState(failure.errMessage)),
        (success) => emit(DeleteFromFavoritesSuccessState()));
  }

  Future<void> removeAllFavorites() async {
    emit(FavoritesLoadingState());
    final result = await favoritesRepo.removeAllFavorites();
    result.fold(
      (failure) => emit(DeleteFromFavoritesFailureState(failure.errMessage)),
      (success) => emit(DeleteFromFavoritesSuccessState()),
    );
  }

  updateFavoritesList(Data product) async {
    if (product.isFavorite!) {
      await addToFav(product.id!);
    } else if (!product.isFavorite!) {
      await deleteFromFav(product.id!);
    }
  }
}
