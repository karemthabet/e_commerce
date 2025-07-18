import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/products/data/models/product_model.dart';
part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());
  static List<Data> favoritesItems = [];

  void updateFavoritesHeart(Data product) {
    product.isFavorite = !product.isFavorite!;
    emit(UpdateFavoritesHeartSuccessState());
  }

  getFavorites() {
    emit(GetFavoritesSuccessState(favoritesItems));

    return favoritesItems;
  }

  void addToFav(Data product) {
    favoritesItems.add(product);
    emit(AddToFavoritesSuccessState());
  }

  void deleteFromFav(Data product) {
    favoritesItems.remove(product);
    emit(DeleteFromFavoritesSuccessState());
  }

  void updateFavoritesList(Data product) {
    if (product.isFavorite!) {
      favoritesItems.add(product);
    } else if (!product.isFavorite!) {
      favoritesItems.remove(product);
    } else {
      favoritesItems.removeWhere((item) => item.id == product.id);
    }
    emit(UpdateFavoritesListSuccessState(favoritesItems));
  }
}
