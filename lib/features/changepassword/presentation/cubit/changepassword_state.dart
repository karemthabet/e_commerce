part of 'changepassword_cubit.dart';

abstract class ChangePasswordState {}

class ChangepasswordInitial extends ChangePasswordState {}

class ChangepasswordLoading extends ChangePasswordState {}

class ChangepasswordSuccess extends ChangePasswordState {}

class ChangepasswordError extends ChangePasswordState {
  final String error;
  ChangepasswordError({required this.error});
}
