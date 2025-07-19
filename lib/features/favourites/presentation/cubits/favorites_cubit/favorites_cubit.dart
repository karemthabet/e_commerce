
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

  addToFav(Data product) async {
    emit(FavoritesLoadingState());
    final result = await favoritesRepo.addToFavorites(product: product);
    result.fold(
      (failure) => emit(AddToFavoritesFailureState(failure.errMessage)),
      (success) => emit(AddToFavoritesSuccessState(success)),
    );
  }

  deleteFromFav(Data product) async {
    emit(FavoritesLoadingState());
    final result = await favoritesRepo.removeFromFavorites(product: product);
    result.fold(
        (failure) => emit(DeleteFromFavoritesFailureState(failure.errMessage)),
        (success) => emit(DeleteFromFavoritesSuccessState(success)));
  }

  Future<void> removeAllFavorites() async {
    emit(FavoritesLoadingState());
    final result = await favoritesRepo.removeAllFavorites();
    result.fold(
      (failure) => emit(DeleteFromFavoritesFailureState(failure.errMessage)),
      (success) => emit(DeleteFromFavoritesSuccessState(success)),
    );
  }

  updateFavoritesList(Data product) async {
    if (product.isFavorite!) {
      await addToFav(product);
    } else if (!product.isFavorite!) {
      await deleteFromFav(product);
    }
  }
}
