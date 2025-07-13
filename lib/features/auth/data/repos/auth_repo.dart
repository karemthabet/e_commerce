
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/auth/data/models/create_account_request_model.dart' show CreateAccountRequestModel;

import '../models/login_request_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, void>> createAccount({
    required CreateAccountRequestModel createAccountRequestModel,
  });

  Future<Either<Failure, void>> login({
    required LoginRequestModel loginRequestModel,
  });
  Future<Either<Failure, void>> forgotPassword({required String email});
}
