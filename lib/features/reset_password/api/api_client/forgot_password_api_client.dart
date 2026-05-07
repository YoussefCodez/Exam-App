import 'package:dio/dio.dart';
import 'package:exam/features/reset_password/data/models/request_model.dart';
import 'package:exam/features/reset_password/data/models/forgot_password_response.dart';
import 'package:exam/features/reset_password/data/models/new_password_response.dart';
import 'package:exam/features/reset_password/data/models/verify_reset_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/values/endpoints/endpoints.dart';
part 'forgot_password_api_client.g.dart';

@LazySingleton()
@RestApi()
abstract class ForgotPasswordApiClient {
  @factoryMethod
  factory ForgotPasswordApiClient(Dio dio) = _ForgotPasswordApiClient;

  @POST(Endpoints.forgotPasswordUrl)
  Future<ForgotPasswordResponse> forgotPassword(
    @Body() RequestModel requestModel,
  );

  @PUT(Endpoints.resetPasswordUrl)
  Future<NewPasswordResponse> newPassword(@Body() RequestModel requestModel);

  @POST(Endpoints.verifyResetCodeUrl)
  Future<VerifyResetResponse> verifyResetCode(
    @Body() RequestModel requestModel,
  );
}
