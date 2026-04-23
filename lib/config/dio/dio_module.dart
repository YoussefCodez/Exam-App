import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../core/values/endpoints/endpoints.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio dio() {
    final dio = Dio();

    dio.options.baseUrl = Endpoints.baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 20);
    dio.options.receiveTimeout = const Duration(seconds: 20);

    return dio;
  }
}
