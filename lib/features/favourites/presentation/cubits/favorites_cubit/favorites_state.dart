part of 'favorites_cubit.dart';

abstract class FavoritesState {
  const FavoritesState();
}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesLoadingState extends FavoritesState {}

final class AddToFavoritesSuccessState extends FavoritesState {}

final class AddToFavoritesFailureState extends FavoritesState {
  final String error;
  const AddToFavoritesFailureState(this.error);
}

final class GetFavoritesSuccessState extends FavoritesState {
  final List<Data> favorites;

  const GetFavoritesSuccessState(this.favorites);
}

final class GetFavoritesFailureState extends FavoritesState {
  final String error;
  const GetFavoritesFailureState(this.error);
}

final class DeleteFromFavoritesSuccessState extends FavoritesState {}

final class DeleteFromFavoritesFailureState extends FavoritesState {
  final String error;
  const DeleteFromFavoritesFailureState(this.error);
}
