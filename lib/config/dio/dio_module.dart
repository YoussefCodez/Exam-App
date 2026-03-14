import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../values/endpoints.dart';

@module
abstract class DioModule {

  @lazySingleton
  Dio dio() {
    final dio = Dio();

    dio.options.baseUrl = Endpoints.baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 3);

    return dio;
  }
}