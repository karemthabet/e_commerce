// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';

import 'package:e_commerce/features/auth/data/repos/auth_repo.dart';

part 'changepassword_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(
    this.authRepo,
  ) : super(ChangepasswordInitial());
  final AuthRepo authRepo;

  void changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    emit(ChangepasswordLoading());
    final result = await authRepo.changePassword(
        newPassword: newPassword, currentPassword: currentPassword);
    result.fold((failure) {
      emit(ChangepasswordError(error: failure.errMessage));
    }, (r) => emit(ChangepasswordSuccess()));
  }
}
