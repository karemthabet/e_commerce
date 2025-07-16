abstract class ResetPasswordStates{}

class ResetPasswordInitial extends ResetPasswordStates{}

class ResetPasswordLoading extends ResetPasswordStates{}

class ResetPasswordSuccess extends ResetPasswordStates{}

class ResetPasswordFailure extends ResetPasswordStates
{
  final String errMessage;
  ResetPasswordFailure({required this.errMessage});
}
