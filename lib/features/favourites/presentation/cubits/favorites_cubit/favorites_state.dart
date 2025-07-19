part of 'favorites_cubit.dart';

// abstract
abstract class FavoritesState {
  const FavoritesState();
}

// initials
final class FavoritesInitial extends FavoritesState {}

final class FavoritesLoadingState extends FavoritesState {}

// ui
final class UpdateFavoritesHeartSuccessState extends FavoritesState {}

final class UpdateFavoritesHeartFailureState extends FavoritesState {
  final String error;
  const UpdateFavoritesHeartFailureState(this.error);
}

// update the attribute itself in the item locally

final class UpdateIsFavoriteAttributeSuccessState extends FavoritesState {
  final String successMessage;
  const UpdateIsFavoriteAttributeSuccessState(this.successMessage);
}

final class UpdateIsFavoriteAttributeFailureState extends FavoritesState {
  final String error;
  const UpdateIsFavoriteAttributeFailureState(this.error);
}

// get
final class GetFavoritesSuccessState extends FavoritesState {
  final List<Data> favorites;

  const GetFavoritesSuccessState(this.favorites);
}

final class GetFavoritesFailureState extends FavoritesState {
  final String error;
  const GetFavoritesFailureState(this.error);
}

// add
final class AddToFavoritesSuccessState extends FavoritesState {
  final List<Data> favorites;

  const AddToFavoritesSuccessState(this.favorites);
}

final class AddToFavoritesFailureState extends FavoritesState {
  final String error;
  const AddToFavoritesFailureState(this.error);
}

// delete
final class DeleteFromFavoritesSuccessState extends FavoritesState {
  final List<Data> favorites;
  const DeleteFromFavoritesSuccessState(this.favorites);
}

final class DeleteFromFavoritesFailureState extends FavoritesState {
  final String error;
  const DeleteFromFavoritesFailureState(this.error);
}

// update the list of favorites
final class UpdateFavoritesListSuccessState extends FavoritesState {
  final List<Data> favorites;

  const UpdateFavoritesListSuccessState(this.favorites);
}
