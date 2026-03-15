import 'package:dio/dio.dart';
import 'package:exam/config/values/endpoints.dart';
import 'package:exam/features/login/data/models/login_request.dart';
import 'package:exam/features/login/data/models/user_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'login_api_client.g.dart';

@injectable
@RestApi(baseUrl: Endpoints.baseUrl)
abstract class LoginApiClient {
  @factoryMethod
  factory LoginApiClient(Dio dio) = _LoginApiClient;

  @POST(Endpoints.loginUrl)
  Future<UserModel> login(@Body() LoginRequest loginRequest);
}
