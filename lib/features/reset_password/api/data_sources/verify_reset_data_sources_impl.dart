import 'package:dio/dio.dart';
import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/features/reset_password/api/api_client/verify_reset_api_client.dart';
import 'package:exam/features/reset_password/data/data_sources/verify_reset_data_sources_contract.dart';
import 'package:exam/features/reset_password/data/models/verify_reset_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: VerifyResetDataSourcesContract)
class VerifyResetDataSourcesImpl implements VerifyResetDataSourcesContract {
  final VerifyResetApiClient verifyResetApiClient;
  VerifyResetDataSourcesImpl(this.verifyResetApiClient);

  @override
  Future<BaseResponse<VerifyResetResponse>> verifyResetCode(String code) async {
    try {
      final response = await verifyResetApiClient.verifyResetCode({
        'resetCode': code,
      });
      return SuccessBaseResponse<VerifyResetResponse>(data: response);
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

      return ErrorBaseResponse<VerifyResetResponse>(
        message: message,
        code: code ?? -1,
      );
    } catch (e) {
      return ErrorBaseResponse<VerifyResetResponse>(
        message: e.toString(),
        code: -1,
      );
    }
  }
}
