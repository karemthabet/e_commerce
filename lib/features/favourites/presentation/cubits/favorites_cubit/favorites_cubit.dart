import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/favourites/data/repos/favorites_repo.dart';
import 'package:e_commerce/features/products/data/models/product_model.dart';
part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesRepo favoritesRepo;
  FavoritesCubit(this.favoritesRepo) : super(FavoritesInitial());
  static List<Data> favoritesItems = [];

  void updateFavoritesHeart(Data product) {
    product.isFavorite = !product.isFavorite!;
    emit(UpdateFavoritesHeartSuccessState());
  }

  Future<void> updateIsFavoriteAttribute(String? productId, bool? newValue) async {
    final result = await favoritesRepo.updateProductAttributeById(
      productId: productId,
      attribute: "isFavorite",
      newValue: newValue,
    );
    result.fold(
      (failure) => emit(UpdateFavoritesHeartFailureState(failure.errMessage!)),
      (success) => emit(UpdateIsFavoriteAttributeSuccessState(success)),
    );

    
  }

  getFavorites() {
    emit(GetFavoritesSuccessState(favoritesItems));

    return favoritesItems;
  }

  void addToFav(Data product) {
    favoritesItems.add(product);
 //   emit(AddToFavoritesSuccessState());
  }

  void deleteFromFav(Data product) {
    favoritesItems.remove(product);
   // emit(DeleteFromFavoritesSuccessState());
  }

  void updateFavoritesList(Data product) {
    if (product.isFavorite!) {
      addToFav(product);
    } else if (!product.isFavorite!) {
     deleteFromFav(product);
    } else {
      favoritesItems.removeWhere((item) => item.id == product.id);
    }
    emit(UpdateFavoritesListSuccessState(favoritesItems));
  }
}
