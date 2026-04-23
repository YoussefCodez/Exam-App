import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
<<<<<<< HEAD
import '../../core/values/endpoints/endpoints.dart';
=======
import 'token_interceptor.dart';
import '../../core/values/endpoints.dart';
>>>>>>> 1cd2b61240cec86a61c3c1e360e115333a02c5ed

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
