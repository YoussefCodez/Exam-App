import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../values/endpoints.dart';

@module
abstract class DioModule {

  @lazySingleton
  Dio dio() {
    final dio = Dio();

    dio.options.baseUrl = Endpoints.baseUrl;

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        if (options.data != null) {
          // Print outgoing request body (including signup user object)
          print('DIO REQUEST: ${options.method} ${options.uri}');
          print('DIO REQUEST BODY: ${options.data}');
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print('DIO RESPONSE: ${response.statusCode} ${response.requestOptions.uri}');
        return handler.next(response);
      },
      onError: (DioException err, handler) {
        print('DIO ERROR: ${err.response?.statusCode} ${err.requestOptions.uri}');
        print('DIO ERROR DATA: ${err.response?.data}');
        return handler.next(err);
      },
    ));

    return dio;
  }
}