import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/features/reset_password/data/models/new_password_response.dart';

abstract class NewPasswordDataSourcesContract {
  Future<BaseResponse<NewPasswordResponse>> newPassword(String email, String newPassword);
}