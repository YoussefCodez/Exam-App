import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/features/profile/domain/entities/user_profile.dart';

abstract interface class ProfileRepoContract {
  Future<BaseResponse<UserProfile>> getProfile(String token);

  Future<BaseResponse<UserProfile>> updateProfile(String token, UserProfile user);
}