import 'package:dio/dio.dart';
import 'package:exam/features/reset_password/data/models/forgot_password_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../config/values/endpoints.dart';
part 'forgot_password_api_client.g.dart';

@injectable
@RestApi()
abstract class ForgotPasswordApiClient {
  @factoryMethod
  factory ForgotPasswordApiClient(Dio dio) = _ForgotPasswordApiClient;

  @POST(Endpoints.forgotPasswordUrl)
  Future<ForgotPasswordResponse> forgotPassword(
    @Body() Map<String, dynamic> body,
  );
}
