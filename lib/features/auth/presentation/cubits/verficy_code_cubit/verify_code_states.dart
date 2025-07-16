abstract class VerifyCodeStates {}

class VerifyCodeInitial extends VerifyCodeStates {}

class VerifyCodeLoading extends VerifyCodeStates {}

class VerifyCodeSuccess extends VerifyCodeStates {}

class VerifyCodeFailure extends VerifyCodeStates 
{
  final String errMessage;
  VerifyCodeFailure({ required this.errMessage});
}