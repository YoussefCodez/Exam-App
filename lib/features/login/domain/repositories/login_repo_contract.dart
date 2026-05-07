import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/features/login/domain/entities/login_result_entity.dart';

abstract interface class LoginRepoContract {
  Future<BaseResponse<LoginResultEntity>> login(String email, String password);
  Future<void> saveToken(String token);
  Future<void> saveUserCredentials(String email, bool rememberMe);
  Future<void> clearUserCredentials();
  String? getSavedEmail();
  bool getRememberMeStatus();
}