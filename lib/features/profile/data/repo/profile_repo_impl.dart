import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/features/profile/data/data_sources/profile_data_sources_remote_contract.dart';
import 'package:exam/features/profile/data/models/profile_response.dart';
import 'package:exam/features/profile/domain/entities/user_profile.dart';
import 'package:exam/features/profile/domain/repo/profile_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileRepoContract)
class ProfileRepoImpl implements ProfileRepoContract {
  final ProfileDataSourcesRemoteContract dataSources;
  ProfileRepoImpl(this.dataSources);
  @override
  Future<BaseResponse<UserProfile>> getProfile(String token) async {
    final response = await dataSources.getLoggedUserInfo(token);

    switch (response) {
      case SuccessBaseResponse<ProfileResponse>():
        return SuccessBaseResponse<UserProfile>(
          data: response.data!.user!.toDomain(),
          message: response.message,
          token: response.token,
        );
      case ErrorBaseResponse<ProfileResponse>():
        return ErrorBaseResponse<UserProfile>(
          message: response.message,
          code: response.code,
        );
    }
  }

  @override
  Future<BaseResponse<UserProfile>> updateProfile(
    String token,
    String lastName,
  ) async {
    final response = await dataSources.updateLoggedUserInfo(token, lastName);
    switch (response) {
      case SuccessBaseResponse<ProfileResponse>():
        return SuccessBaseResponse<UserProfile>(
          data: response.data?.user?.toDomain(),
          message: response.message,
          token: response.token,
        );
      case ErrorBaseResponse<ProfileResponse>():
        return ErrorBaseResponse<UserProfile>(
          message: response.message,
          code: response.code,
        );
    }
  }
}
