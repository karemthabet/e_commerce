// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/auth/data/repos/auth_repo.dart';
import 'package:e_commerce/features/profile/presentation/cubit/cubit/change_user_data_state.dart';

class ChangeUserDataCubit extends Cubit<ChangeUserDataState> {
  ChangeUserDataCubit(this.authRepo) : super(ChangeUserDataInitial());

  final AuthRepo authRepo;

  void changeUserData({String? newName, String? newEmail}) {
    emit(ChangeUserDataLoading());

    authRepo.changeUserData(newEmail: newEmail, newName: newName).then((result) {
      result.fold(
        (failure) => emit(ChangeUserDataError(errorMessage: failure.errMessage)),
        (_) => emit(ChangeUserDataSuccess()),
      );
    });
  }
}
