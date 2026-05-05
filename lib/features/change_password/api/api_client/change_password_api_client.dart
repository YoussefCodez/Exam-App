import 'package:dio/dio.dart';
import 'package:exam/core/values/endpoints/endpoints.dart';
import 'package:exam/core/values/change_password/change_password_titles.dart';
import 'package:exam/features/change_password/data/models/responses/change_password_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
part 'change_password_api_client.g.dart';

@injectable
@RestApi()
abstract class ChangePasswordApiClient {
  @factoryMethod
  factory ChangePasswordApiClient(Dio dio) = _ChangePasswordApiClient;

  @PATCH(Endpoints.changePasswordUrl)
  Future<ChangePasswordResponse> changePassword(
    @Header(ChangePasswordTitles.token) String token,
    @Body() Map<String, String> changePasswordRequest,
  );
}