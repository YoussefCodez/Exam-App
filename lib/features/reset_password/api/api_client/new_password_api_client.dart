import 'package:dio/dio.dart';
import 'package:exam/features/reset_password/data/models/new_password_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../config/values/endpoints.dart';
part 'new_password_api_client.g.dart';

@injectable
@RestApi()
abstract class NewPasswordApiClient {
  @factoryMethod
  factory NewPasswordApiClient(Dio dio) = _NewPasswordApiClient;

  @PUT(Endpoints.resetPasswordUrl)
  Future<NewPasswordResponse> newPassword(@Body() Map<String, dynamic> body);
}
