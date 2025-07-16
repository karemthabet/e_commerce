
import 'package:e_commerce/features/auth/data/repos/auth_repo.dart';
import 'package:e_commerce/features/auth/presentation/cubits/reset_password_cubit/reset_password_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordStates> {
  ResetPasswordCubit(this._authRepo) : super(ResetPasswordInitial());

  final AuthRepo _authRepo;

  void resetPassword({required String newPassword}) async {
    emit(ResetPasswordLoading());
    final result = await _authRepo.resetPassword(newPassword: newPassword);
    result.fold((failure) {
      emit(ResetPasswordFailure(errMessage: failure.errMessage));
    }, (r) => emit(ResetPasswordSuccess()));
  }
}
