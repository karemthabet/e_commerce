import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/auth/data/models/create_account_request_model.dart';

import '../models/login_request_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, void>> createAccount({
    required CreateAccountRequestModel createAccountRequestModel,
  });

  Future<Either<Failure, void>> login({
    required LoginRequestModel loginRequestModel,
  });
  Future<Either<Failure, void>> forgotPassword({required String email});
  Future<Either<Failure, void>> verfiyCode({required String code});
  Future<Either<Failure, void>> resetPassword({
    required String newPassword,
  });

  Future<Either<Failure, void>> changePassword(
      {required String newPassword, required String currentPassword ,required String rePassword});
    Future<Either<Failure, void>> changeUserData({
  required String newEmail,
  String? newName,
});



}
