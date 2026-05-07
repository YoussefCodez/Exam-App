import 'package:dio/dio.dart';
import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/config/dio/dio_error_handler.dart';
import 'package:exam/features/login/api/remote_data_sources/login_api_client.dart';
import 'package:exam/features/login/data/models/login_request.dart';
import 'package:exam/features/login/data/models/login_response.dart';
import 'package:exam/features/login/data/repositories/login_data_source_remote_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginDataSourceRemoteContract)
class LoginDataSourceRemoteImpl implements LoginDataSourceRemoteContract {
  final LoginApiClient loginApiClient;

  LoginDataSourceRemoteImpl(this.loginApiClient);

  @override
  Future<BaseResponse<LoginResponse>> login(LoginRequest loginRequest) async {
    try {
      final response = await loginApiClient.login(loginRequest);
      return SuccessBaseResponse(
        data: response,
        message: response.message,
        token: response.token,
      );
    } on DioException catch (e) {
      final errorMessage = DioErrorHandler.handle(e);
      final statusCode = e.response?.statusCode ?? 500;
      return ErrorBaseResponse(message: errorMessage, code: statusCode);
    } catch (e) {
      return ErrorBaseResponse(message: "Error Try Again Later", code: 500);
    }
  }
}
