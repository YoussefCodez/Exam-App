import 'package:dio/dio.dart';
import 'package:exam/core/values/endpoints/endpoints.dart';
import 'package:exam/features/login/data/models/login_request.dart';
import 'package:exam/features/login/data/models/login_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'login_api_client.g.dart';

@lazySingleton
@RestApi(baseUrl: Endpoints.baseUrl)
abstract class LoginApiClient {
  @factoryMethod
  factory LoginApiClient(Dio dio) = _LoginApiClient;

  @POST(Endpoints.loginUrl)
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);
}
