import 'package:dio/dio.dart';
import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/config/dio/dio_error_handler.dart';
import 'package:exam/core/values/reset_password/data_source_map_keys.dart';
import 'package:exam/features/reset_password/data/models/request_model.dart';
import 'package:exam/features/reset_password/api/api_client/forgot_password_api_client.dart';
import 'package:exam/features/reset_password/data/data_sources/forgot_password_data_sources_contract.dart';
import 'package:exam/features/reset_password/data/models/forgot_password_response.dart';
import 'package:exam/features/reset_password/data/models/new_password_response.dart';
import 'package:exam/features/reset_password/data/models/verify_reset_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForgotPasswordDataSourcesContract)
class ForgotPasswordDataSourcesImpl
    implements ForgotPasswordDataSourcesContract {
  final ForgotPasswordApiClient apiClient;
  ForgotPasswordDataSourcesImpl(this.apiClient);

  @override
  Future<BaseResponse<ForgotPasswordResponse>> forgotPassword(
    String email,
  ) async {
    try {
      final response = await apiClient.forgotPassword(
        RequestModel(body: {DataSourceMapKeys.email: email}),
      );
      return SuccessBaseResponse<ForgotPasswordResponse>(data: response);
    } on DioException catch (e) {
      return ErrorBaseResponse(
        message: DioErrorHandler.handle(e),
        code: DioErrorHandler.getStatusCode(e) ?? 404,
      );
    }
  }

  @override
  Future<BaseResponse<VerifyResetResponse>> verifyResetCode(String code) async {
    try {
      final response = await apiClient.verifyResetCode(
        RequestModel(body: {DataSourceMapKeys.resetCode: code}),
      );
      return SuccessBaseResponse<VerifyResetResponse>(data: response);
    } on DioException catch (e) {
      return ErrorBaseResponse(
        message: DioErrorHandler.handle(e),
        code: DioErrorHandler.getStatusCode(e) ?? 404,
      );
    }
  }

  @override
  Future<BaseResponse<NewPasswordResponse>> newPassword(
    String email,
    String newPassword,
  ) async {
    try {
      final response = await apiClient.newPassword(
        RequestModel(
          body: {
            DataSourceMapKeys.email: email,
            DataSourceMapKeys.newPassword: newPassword,
          },
        ),
      );
      return SuccessBaseResponse<NewPasswordResponse>(
        data: NewPasswordResponse(
          message: response.message,
          token: response.token,
        ),
      );
    } on DioException catch (e) {
      return ErrorBaseResponse(
        message: DioErrorHandler.handle(e),
        code: DioErrorHandler.getStatusCode(e) ?? 404,
      );
    }
  }
}
