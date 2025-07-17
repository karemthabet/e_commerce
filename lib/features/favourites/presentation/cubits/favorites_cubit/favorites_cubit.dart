import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/products/data/models/product_model.dart';
part 'favorites_state.dart';



class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());
  static List<Data> FavoritesItems = [];

  void addToFav(Data product) {
    FavoritesItems.add(product);
    emit(AddToFavoritesSuccessState());
  }

  getFavorites() {

    emit(GetFavoritesSuccessState(FavoritesItems));

    return FavoritesItems;
  }

  void deleteFromFav(Data product) {
    FavoritesItems.remove(product);
    emit(DeleteFromFavoritesSuccessState());
  }

}
