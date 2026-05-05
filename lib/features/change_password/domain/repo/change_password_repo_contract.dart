import 'package:exam/config/base_response/base_response.dart';

abstract interface class ChangePasswordRepoContract {
  Future<BaseResponse<String>> changePassword({
    required String token,
    required String oldPassword,
    required String password,
    required String rePassword,
  });
}