import 'package:dio/dio.dart';
import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/config/di/di.dart';
import 'package:exam/config/dio/dio_error_handler.dart';
import 'package:exam/core/app_strings/app_strings.dart';
import 'package:exam/features/change_password/api/api_client/change_password_api_client.dart';
import 'package:exam/features/change_password/data/data_sources/change_password_data_sources_contract.dart';
import 'package:exam/features/change_password/data/models/requests/change_password_request.dart';
import 'package:exam/features/change_password/data/models/responses/change_password_response.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ChangePasswordDataSourcesContract)
class ChangePasswordDataSourcesImpl
    implements ChangePasswordDataSourcesContract {
  final ChangePasswordApiClient apiClient;
  ChangePasswordDataSourcesImpl(this.apiClient);

  @override
  Future<BaseResponse<ChangePasswordResponse>> changePassword({
    required String token,
    required String oldPassword,
    required String password,
    required String rePassword,
  }) async {
    try {
      final response = await apiClient.changePassword(
        token,
        ChangePasswordRequest(
          oldPassword: oldPassword,
          password: password,
          rePassword: rePassword,
        ).toJson(),
      );

      final storage = getIt<FlutterSecureStorage>();
      await storage.write(key: AppStrings.tokenKey, value: response.token);

      return SuccessBaseResponse<ChangePasswordResponse>(
        message: response.message,
        token: response.token,
        data: null,
      );
    } on DioException catch (e) {
      return ErrorBaseResponse(
        message: DioErrorHandler.handle(e),
        code: DioErrorHandler.getStatusCode(e) ?? 404,
      );
    }
  }
}
