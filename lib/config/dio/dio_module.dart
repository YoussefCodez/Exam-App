import 'package:dio/dio.dart';
import 'package:exam/core/values/endpoints/endpoints.dart';
import 'package:injectable/injectable.dart';
import 'token_interceptor.dart';
@module
abstract class DioModule {
  @lazySingleton
  Dio dio(TokenInterceptor tokenInterceptor) {
    final dio = Dio();

    dio.options.baseUrl = Endpoints.baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 20);
    dio.options.receiveTimeout = const Duration(seconds: 20);

    dio.interceptors.add(tokenInterceptor);

    return dio;
  }
}
