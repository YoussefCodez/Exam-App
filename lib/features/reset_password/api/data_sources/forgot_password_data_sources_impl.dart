import 'package:dio/dio.dart';
import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/features/reset_password/api/api_client/forgot_password_api_client.dart';
import 'package:exam/features/reset_password/data/data_sources/forgot_password_data_sources_contract.dart';
import 'package:exam/features/reset_password/data/models/forgot_password_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForgotPasswordDataSourcesContract)
class ForgotPasswordDataSourcesImpl
    implements ForgotPasswordDataSourcesContract {
  ForgotPasswordApiClient apiClient;
  ForgotPasswordDataSourcesImpl(this.apiClient);

  @override
  Future<BaseResponse<ForgotPasswordResponse>> forgotPassword(
    String email,
  ) async {
    try {
      final response = await apiClient.forgotPassword({'email': email});
      return SuccessBaseResponse<ForgotPasswordResponse>(data: response);
    } on DioException catch (e) {
      String message = 'Something went wrong';
      int? code;

      if (e.response != null) {
        // Server responded with error
        code = e.response?.statusCode;

        message =
            e.response?.data?['message'] ??
            e.response?.statusMessage ??
            'Server error';
      } else {
        // No response (network issue, timeout, etc.)
        switch (e.type) {
          case DioExceptionType.connectionTimeout:
            message = 'Connection timeout';
            break;
          case DioExceptionType.sendTimeout:
            message = 'Send timeout';
            break;
          case DioExceptionType.receiveTimeout:
            message = 'Receive timeout';
            break;
          case DioExceptionType.badCertificate:
            message = 'Bad certificate';
            break;
          case DioExceptionType.connectionError:
            message = 'No internet connection';
            break;
          case DioExceptionType.cancel:
            message = 'Request cancelled';
            break;
          case DioExceptionType.unknown:
            message = 'Unexpected error occurred';
            break;
          case DioExceptionType.badResponse:
            message = 'Bad response';
            break;
        }
      }

      return ErrorBaseResponse<ForgotPasswordResponse>(
        message: message,
        code: code ?? -1,
      );
    } catch (e) {
      return ErrorBaseResponse<ForgotPasswordResponse>(
        message: e.toString(),
        code: -1,
      );
    }
  }
}
