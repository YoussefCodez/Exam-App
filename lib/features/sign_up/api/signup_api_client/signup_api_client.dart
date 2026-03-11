import 'package:dio/dio.dart';
import 'package:exam/config/base_response/base_response.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../config/values/endpoints.dart';
import '../../data/models/signup_response.dart';
part 'signup_api_client.g.dart';

@RestApi()
abstract class SignupApiClient {
  factory SignupApiClient(Dio dio, {String? baseUrl}) = _SignupApiClient;

  @POST(Endpoints.signUpUrl)
  Future<SignUpResponse> addUser();

}






