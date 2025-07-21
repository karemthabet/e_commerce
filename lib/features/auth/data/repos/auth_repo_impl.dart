import 'package:dartz/dartz.dart';

import 'package:e_commerce/core/cache/prefs.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/utils/constants/app_constants.dart';
import 'package:e_commerce/core/utils/constants/end_points.dart';
import 'package:e_commerce/features/auth/data/models/create_account_request_model.dart';
import 'package:e_commerce/features/auth/data/models/login_request_model.dart';
import 'package:e_commerce/features/auth/data/repos/auth_repo.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/services/api_service.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;

  AuthRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, void>> createAccount({
    required CreateAccountRequestModel createAccountRequestModel,
  }) async {
    try {
      final result = await apiService.post(
        EndPoints.register,
        data: createAccountRequestModel.toJson(),
      );
      final String token = result['token'];
      final String userName = result['user']['name'];
      final String email = result['user']['email'];
      Prefs.setString(AppConstants.kUserName, userName);
      Prefs.setString(AppConstants.kForgottenEmail, email);
      Prefs.setString(AppConstants.kToken, token);
      Prefs.setString(AppConstants.kPhone, createAccountRequestModel.phone);

      return const Right(null);
    } on CustomException catch (e) {
      return left((ServerFailure(errMessage: e.message)));
    }
  }

  @override
  Future<Either<Failure, void>> login({
    required LoginRequestModel loginRequestModel,
  }) async {
    try {
      final result = await apiService.post(
        EndPoints.login,
        data: loginRequestModel.toJson(),
      );
      final String token = result['token'];
      final String userName = result['user']['name'];
      final String email = result['user']['email'];
      Prefs.setString(AppConstants.kUserName, userName);
      Prefs.setString(AppConstants.kForgottenEmail, email);
      Prefs.setString(AppConstants.kToken, token);

      return const Right(null);
    } on CustomException catch (e) {
      return left((ServerFailure(errMessage: e.message)));
    }
  }

  @override
  Future<Either<Failure, void>> forgotPassword({
    required String email,
  }) async {
    try {
      await apiService.post(
        EndPoints.forgotPassword,
        data: {"email": email},
      );
      Prefs.setString(AppConstants.kForgottenEmail, email);
      return const Right(null);
    } on CustomException catch (e) {
      return left((ServerFailure(errMessage: e.message)));
    }
  }

  @override
  Future<Either<Failure, void>> verfiyCode({required String code}) async {
    try {
      await apiService.post(
        EndPoints.verifyCode,
        data: {"resetCode": code},
      );
      return const Right(null);
    } on CustomException catch (e) {
      return left((ServerFailure(errMessage: e.message)));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword({
    required String newPassword,
  }) async {
    try {
      final result = await apiService.put(
        EndPoints.resetPassword,
        data: {
          "newPassword": newPassword,
          "email": Prefs.getString(AppConstants.kForgottenEmail),
        },
      );
      final String token = result['token'];
      Prefs.setString(AppConstants.kToken, token);
      Prefs.removeData(key: AppConstants.kForgottenEmail);
      return const Right(null);
    } on CustomException catch (e) {
      return left((ServerFailure(errMessage: e.message)));
    }
  }

  @override
  Future<Either<Failure, void>> changePassword(
      {required String newPassword, required String currentPassword}) async {
    {
      try {
        final result = await apiService.put(
          EndPoints.changeMyPassword,
          data: {
            "currentPassword": currentPassword,
            "password": newPassword,
            "rePassword": newPassword
          },
        );
        final String token = result['token'];
        Prefs.setString(AppConstants.kToken, token);
        return const Right(null);
      } on CustomException catch (e) {
        return left((ServerFailure(errMessage: e.message)));
      }
    }
  }
}
