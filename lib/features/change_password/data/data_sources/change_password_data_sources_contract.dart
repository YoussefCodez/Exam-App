import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/features/change_password/data/models/responses/change_password_response.dart';

abstract interface class ChangePasswordDataSourcesContract {
  Future<BaseResponse<ChangePasswordResponse>> changePassword({
    required String token,
    required String oldPassword,
    required String password,
    required String rePassword,
  });
}