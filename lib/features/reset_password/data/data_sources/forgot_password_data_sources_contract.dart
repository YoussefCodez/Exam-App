import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/features/reset_password/data/models/forgot_password_response.dart';

abstract class ForgotPasswordDataSourcesContract {
  Future<BaseResponse<ForgotPasswordResponse>> forgotPassword(String email);
}
