import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/core/app_strings/app_strings.dart';
import 'package:exam/features/login/api/local_data_source/login_local_data_source.dart';
import 'package:exam/features/login/data/models/login_request.dart';
import 'package:exam/features/login/data/models/login_response.dart';
import 'package:exam/features/login/data/repositories/login_data_source_remote_contract.dart';
import 'package:exam/features/login/domain/entities/login_result_entity.dart';
import 'package:exam/features/login/domain/entities/user_entity.dart';
import 'package:exam/features/login/domain/repositories/login_repo_contract.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRepoContract)
class LoginRepoImpl implements LoginRepoContract {
  final LoginDataSourceRemoteContract loginDataSourceRemote;
  final LoginLocalDataSource loginLocalDataSource;
  final FlutterSecureStorage secureStorage;

  LoginRepoImpl({
    required this.loginDataSourceRemote,
    required this.loginLocalDataSource,
    required this.secureStorage,
  });

  @override
  Future<BaseResponse<LoginResultEntity>> login(String email, String password) async {
    final loginRequest = LoginRequest(email: email, password: password);
    final result = await loginDataSourceRemote.login(loginRequest);
    return switch (result) {
      SuccessBaseResponse<LoginResponse>(data: final data) => SuccessBaseResponse<LoginResultEntity>(
          data: LoginResultEntity(
            token: data?.token ?? "",
            user: data?.user?.toUserEntity(data.token ?? "") ??
                UserEntity(name: '', email: '', phone: '', token: ''),
          ),
          message: result.message,
          token: result.token,
        ),
      ErrorBaseResponse(message: final message, code: final code) => ErrorBaseResponse<LoginResultEntity>(
          message: message,
          code: code,
        ),
    };
  }

  @override
  Future<void> saveToken(String token) async {
    await secureStorage.write(key: AppStrings.tokenKey, value: token);
  }

  @override
  Future<void> saveUserCredentials(String email, bool rememberMe) async {
    await loginLocalDataSource.saveUserCredentials(email, rememberMe);
  }

  @override
  Future<void> clearUserCredentials() async {
    await loginLocalDataSource.clearUserCredentials();
  }

  @override
  String? getSavedEmail() {
    return loginLocalDataSource.getSavedEmail();
  }

  @override
  bool getRememberMeStatus() {
    return loginLocalDataSource.getRememberMeStatus();
  }
}
