import 'package:dio/dio.dart';
import 'package:exam/features/reset_password/data/models/verify_reset_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../config/values/endpoints.dart';
part 'verify_reset_api_client.g.dart';

@injectable
@RestApi()
abstract class VerifyResetApiClient {
  @factoryMethod
  factory VerifyResetApiClient(Dio dio) = _VerifyResetApiClient;

  @POST(Endpoints.verifyResetCodeUrl)
  Future<VerifyResetResponse> verifyResetCode(
    @Body() Map<String, dynamic> body,
  );
}
