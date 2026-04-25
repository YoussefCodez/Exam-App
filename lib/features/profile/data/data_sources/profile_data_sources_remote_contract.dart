import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/features/profile/data/models/profile_response.dart';

abstract interface class ProfileDataSourcesRemoteContract {
  Future<BaseResponse<ProfileResponse>> getLoggedUserInfo(String token);

  Future<BaseResponse<ProfileResponse>> updateLoggedUserInfo(String token,String lastName);
}