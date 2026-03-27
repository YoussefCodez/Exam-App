import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'token_interceptor.dart';
import '../../core/values/endpoints.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio dio(TokenInterceptor tokenInterceptor) {
    final dio = Dio();

    dio.options.baseUrl = Endpoints.baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 3);

    dio.interceptors.add(tokenInterceptor);

    return dio;
  }
}