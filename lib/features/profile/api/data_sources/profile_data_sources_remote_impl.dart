import 'package:dio/dio.dart';
import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/config/dio/dio_error_handler.dart';
import 'package:exam/core/values/profile/profile_titles.dart';
import 'package:exam/features/profile/api/api_client/profile_api_client.dart';
import 'package:exam/features/profile/data/models/profile_response.dart';
import 'package:exam/features/profile/data/data_sources/profile_data_sources_remote_contract.dart';
import 'package:exam/features/profile/domain/entities/user_profile.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileDataSourcesRemoteContract)
class ProfileDataSourcesRemoteImpl implements ProfileDataSourcesRemoteContract {
  final ProfileApiClient apiClient;
  ProfileDataSourcesRemoteImpl(this.apiClient);
  @override
  Future<BaseResponse<ProfileResponse>> getLoggedUserInfo(String token) async {
    try {
      final response = await apiClient.getLoggedUserInfo(token);
      return SuccessBaseResponse<ProfileResponse>(data: response);
    } on DioException catch (e) {
      return ErrorBaseResponse(
        message: DioErrorHandler.handle(e),
        code: DioErrorHandler.getStatusCode(e) ?? 404,
      );
    }
  }

  @override
  Future<BaseResponse<ProfileResponse>> updateLoggedUserInfo(
    String token,
    UserProfile user,
  ) async {
    try {
      final response = await apiClient
          .updateLoggedUserInfo(token, <String, String?>{
            ProfileTitles.lastName: user.lastName,
            ProfileTitles.firstName: user.firstName,
            ProfileTitles.username: user.username,
            ProfileTitles.email: user.email,
            ProfileTitles.phone: user.phone,
          });
      return SuccessBaseResponse<ProfileResponse>(data: response);
    } on DioException catch (e) {
      return ErrorBaseResponse(
        message: DioErrorHandler.handle(e),
        code: DioErrorHandler.getStatusCode(e) ?? 404,
      );
    }
  }
}
