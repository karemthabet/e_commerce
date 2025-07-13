abstract class CreateAccountStates {}

class CreateAccountInitial extends CreateAccountStates {}

class CreateAccountLoading extends CreateAccountStates {}

class CreateAccountSuccess extends CreateAccountStates {}

class CreateAccountFailure extends CreateAccountStates {
  final String errMessage;
  CreateAccountFailure({required this.errMessage});
}
