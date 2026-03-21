import 'package:dio/dio.dart';
import 'package:exam/features/reset_password/data/models/forgot_password_response.dart';
import 'package:exam/features/reset_password/data/models/new_password_response.dart';
import 'package:exam/features/reset_password/data/models/verify_reset_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/values/endpoints.dart';
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

  @PUT(Endpoints.resetPasswordUrl)
  Future<NewPasswordResponse> newPassword(@Body() Map<String, dynamic> body);

  @POST(Endpoints.verifyResetCodeUrl)
  Future<VerifyResetResponse> verifyResetCode(
    @Body() Map<String, dynamic> body,
  );
}
