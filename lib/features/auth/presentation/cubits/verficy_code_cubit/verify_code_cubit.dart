import 'package:e_commerce/features/auth/presentation/cubits/verficy_code_cubit/verify_code_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/auth_repo.dart';

class VerifyCodeCubit extends Cubit<VerifyCodeStates> {
  VerifyCodeCubit(this._authRepo) : super(VerifyCodeInitial());

  final AuthRepo _authRepo;

  void verfiyCode({required String code}) async {
    emit(VerifyCodeLoading());
    final result = await _authRepo.verfiyCode(code: code);
    result.fold((failure) {
      emit(VerifyCodeFailure(errMessage: failure.errMessage));
    }, (r) => emit(VerifyCodeSuccess()));
  }
}
