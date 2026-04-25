import 'package:dio/dio.dart';
import 'package:exam/core/values/endpoints/endpoints.dart';
import 'package:exam/main.dart';
import 'package:exam/config/dio/dio_error_handler.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:exam/core/app_strings/app_strings.dart';
import 'package:injectable/injectable.dart';

@injectable
class TokenInterceptor extends Interceptor {
  final FlutterSecureStorage storage;

  TokenInterceptor(this.storage);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final authEndpoints = [
      Endpoints.loginUrl,
      Endpoints.signUpUrl,
      Endpoints.forgotPasswordUrl,
      Endpoints.verifyResetCodeUrl,
      Endpoints.resetPasswordUrl,
    ];

    if (!authEndpoints.any((e) => options.path.contains(e))) {
      final token = await storage.read(key: AppStrings.tokenKey);
      if (token != null) {
        options.headers['token'] = token;
      }
    }
    
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final authEndpoints = [
      Endpoints.loginUrl,
      Endpoints.signUpUrl,
    ];

    if (DioErrorHandler.isTokenExpired(err) ?? false) {
      if (!authEndpoints.any((e) => err.requestOptions.path.contains(e))) {
        await storage.delete(key: AppStrings.tokenKey);
        await storage.delete(key: AppStrings.rememberMeKey);
        MyApp.navigatorKey.currentState?.pushNamedAndRemoveUntil(
          AppStrings.loginRoute,
          (route) => false,
        );
      }
    }
    handler.next(err);
  }
}
