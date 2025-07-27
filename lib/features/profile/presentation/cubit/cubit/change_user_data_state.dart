abstract class ChangeUserDataState {}

final class ChangeUserDataInitial extends ChangeUserDataState {}

final class ChangeUserDataLoading extends ChangeUserDataState {}

final class ChangeUserDataSuccess extends ChangeUserDataState {}

final class ChangeUserDataError extends ChangeUserDataState {
  String errorMessage;

  ChangeUserDataError({required this.errorMessage});
}
