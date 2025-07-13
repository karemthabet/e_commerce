import 'package:e_commerce/features/auth/data/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'forgot_password_states.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordStates> {
  ForgotPasswordCubit(this._authRepo) : super(ForgotPasswordInitial());

  final AuthRepo _authRepo;

  void forgotPassword({required String email}) async {
    emit(ForgotPasswordLoading());
    final result = await _authRepo.forgotPassword(email: email);
    result.fold((failure) {
      emit(ForgotPasswordFailure(errMessage: failure.errMessage));
    }, (r) => emit(ForgotPasswordSuccess()));
  }
}
