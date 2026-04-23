import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/values/endpoints/endpoints.dart';
import '../../data/models/signup_response.dart';
import '../../domain/entities/user_created.dart';
part 'signup_api_client.g.dart';

@LazySingleton()
@RestApi()
abstract class SignupApiClient {
  @factoryMethod
  factory SignupApiClient(Dio dio) = _SignupApiClient;

  @POST(Endpoints.signUpUrl)
  Future<SignUpResponse> addUser(@Body() UserCreated user);
}






