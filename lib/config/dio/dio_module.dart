import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../values/endpoints.dart';

@module
abstract class DioModule {
  @singleton
  Dio dio() {
    final dio = Dio(); // With default `Options`.
    // Set default configs
    dio.options.baseUrl = Endpoints.baseUrl;
    dio.options.connectTimeout = Duration(seconds: 5);
    dio.options.receiveTimeout = Duration(seconds: 3);

    return dio;
  }
}
