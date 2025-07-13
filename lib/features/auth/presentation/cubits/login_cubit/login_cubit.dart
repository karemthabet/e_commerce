import 'package:e_commerce/features/auth/data/models/login_request_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/auth_repo.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this._authRepo) : super(LoginInitial());

  final AuthRepo _authRepo;

  void login({required LoginRequestModel loginRequestModel}) async {
    emit(LoginLoading());
    final result = await _authRepo.login(
      loginRequestModel: loginRequestModel,
    );
    result.fold((failure) {
      emit(LoginFailure(errMessage: failure.errMessage));
    }, (r) => emit(LoginSuccess()));
  }
}
