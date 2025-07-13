import 'package:e_commerce/features/auth/data/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/create_account_request_model.dart';
import 'create_account_states.dart';

class CreateAccountCubit extends Cubit<CreateAccountStates> {
  CreateAccountCubit(this._authRepo) : super(CreateAccountInitial());

  final AuthRepo _authRepo;

  void createAccount({
    required CreateAccountRequestModel createAccountRequestModel,
  }) async {
    emit(CreateAccountLoading());
    final result = await _authRepo.createAccount(
      createAccountRequestModel: createAccountRequestModel,
    );
    result.fold((failure) {
      emit(CreateAccountFailure(errMessage: failure.errMessage));
    }, (r) => emit(CreateAccountSuccess()));
  }
}
