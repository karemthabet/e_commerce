abstract class ForgotPasswordStates {}

class ForgotPasswordInitial extends ForgotPasswordStates {}

class ForgotPasswordLoading extends ForgotPasswordStates {}

class ForgotPasswordSuccess extends ForgotPasswordStates {}

class ForgotPasswordFailure extends ForgotPasswordStates 
{
  final String errMessage;
  ForgotPasswordFailure({required this.errMessage});
}