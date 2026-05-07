import 'package:dio/dio.dart';
import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/config/dio/dio_error_handler.dart';
import 'package:exam/features/sign_up/api/api_client/signup_api_client.dart';
import 'package:exam/features/sign_up/data/data_sources/signup_data_sources_remote_contract.dart';
import 'package:exam/features/sign_up/data/models/signup_response.dart';
import 'package:exam/features/sign_up/domain/entities/user_created.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignupDataSourcesRemoteContract)
class SignupDataSourcesRemoteImpl implements SignupDataSourcesRemoteContract {
  SignupApiClient apiClient;
  SignupDataSourcesRemoteImpl(this.apiClient);

  @override
  Future<BaseResponse<SignUpResponse>> addUser(UserCreated user) async {
    try {
      final response = await apiClient.addUser(user);
      return SuccessBaseResponse<SignUpResponse>(data: response);
    } on DioException catch (e) {
      return ErrorBaseResponse(
        message: DioErrorHandler.handle(e),
        code: DioErrorHandler.getStatusCode(e) ?? 404,
      );
    }
  }
}
