import 'package:dio/dio.dart';
import 'package:exam/core/values/dio/dio_exception_errors.dart';

class DioErrorHandler {
  static String handle(DioException e) {
    if (e.response != null) {
      final serverMessage = e.response?.data?[DioExceptionErrors.message];
      if (serverMessage != null && serverMessage.toString().isNotEmpty) {
        return serverMessage.toString();
      }
      final statusCode = getStatusCode(e);
      switch(statusCode) {
        case 401:
          return DioExceptionErrors.tokenExpired;
        default:
          return e.response?.statusMessage ?? DioExceptionErrors.serverError;
      }
    } else {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          return DioExceptionErrors.connectionTimeout;
        case DioExceptionType.sendTimeout:
          return DioExceptionErrors.sendTimeout;
        case DioExceptionType.receiveTimeout:
          return DioExceptionErrors.receiveTimeout;
        case DioExceptionType.badCertificate:
          return DioExceptionErrors.badCertificate;
        case DioExceptionType.connectionError:
          return DioExceptionErrors.connectionError;
        case DioExceptionType.cancel:
          return DioExceptionErrors.cancel;
        case DioExceptionType.badResponse:
          return DioExceptionErrors.badResponse;
        case DioExceptionType.unknown:
          return DioExceptionErrors.unknown;
      }
    }
  }

  static int? getStatusCode(DioException e) {
    return e.response?.statusCode;
  }

  static bool? isTokenExpired(DioException e) {
    return getStatusCode(e) == 401;
  }
}
