import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

class FirebaseAuthFailure extends Failure {
  FirebaseAuthFailure({required super.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});

  /// بتتعامل مع أنواع DioException المختلفة
  factory ServerFailure.fromDioExcepiton(
    DioException dioException,
  ) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: 'Connection timeout');

      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: 'Send timeout');

      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: 'Receive timeout');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );

      case DioExceptionType.badCertificate:
        return ServerFailure(errMessage: 'Bad certificate');

      case DioExceptionType.cancel:
        return ServerFailure(
            errMessage: 'Request to API server was cancelled');

      case DioExceptionType.connectionError:
        return ServerFailure(errMessage: 'Connection error');

      default:
        return ServerFailure(
          errMessage: 'Oops, an unknown error occurred',
        );
    }
  }

  /// هنا بنستخرج الرسالة من الرد اللي جاي من السيرفر بأي شكل
  factory ServerFailure.fromResponse(
    int statusCode,
    dynamic response,
  ) {
    if (statusCode >= 400 && statusCode < 500) {
      String? message;

      // لو الرد جاي بشكل Map (كـ JSON)
      if (response is Map<String, dynamic>) {
      message = response['errors']?['msg'] ?? // أول أولوية
          response['message'] ?? // fallback لو مش موجودة
          response['msg'] ?? 
          response['error'] ?? 
          response['errors']?['message'];
    }

      return ServerFailure(
        errMessage: message ?? 'حدث خطأ غير معروف من السيرفر.',
      );
    } else if (statusCode == 500) {
      return ServerFailure(
        errMessage: 'Internal Server Failure, please try again later.',
      );
    } else {
      return ServerFailure(
        errMessage: 'Unknown error, status code $statusCode',
      );
    }
  }
}
