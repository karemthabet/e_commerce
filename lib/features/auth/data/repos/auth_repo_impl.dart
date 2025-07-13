
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/cashed/prefs.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/utils/constants/app_constants.dart';
import 'package:e_commerce/core/utils/constants/end_points.dart';
import 'package:e_commerce/features/auth/data/models/create_account_request_model.dart';
import 'package:e_commerce/features/auth/data/repos/auth_repo.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/services/api_service.dart';
import '../models/login_request_model.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;

  AuthRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, void>> createAccount({
    required CreateAccountRequestModel createAccountRequestModel,
  }) async {
    try {
      await apiService.post(
        EndPoints.register,
        data: createAccountRequestModel.toJson(),
      );
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
      return const Right(null);
    } on CustomException catch (e) {
      return left((ServerFailure(errMessage: e.message)));
    }
  }
}
