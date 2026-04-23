import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/features/login/data/models/login_request.dart';
import 'package:exam/features/login/data/models/user_model.dart';
import 'package:exam/features/login/data/repositories/login_data_source_remote_contract.dart';
import 'package:exam/features/login/domain/entities/login_result_entity.dart';
import 'package:exam/features/login/domain/entities/user_entity.dart';
import 'package:exam/features/login/domain/repositories/login_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRepoContract)
class LoginRepoImpl implements LoginRepoContract {
  final LoginDataSourceRemoteContract loginDataSourceRemote;

  LoginRepoImpl({required this.loginDataSourceRemote});

  @override
  Future<BaseResponse<LoginResultEntity>> login(LoginRequest loginRequest) async {
    final result = await loginDataSourceRemote.login(loginRequest);
    return switch (result) {
      SuccessBaseResponse<LoginResponse>(data: final data) => SuccessBaseResponse<LoginResultEntity>(
          data: LoginResultEntity(
            token: data.token ?? "",
            user: data.user?.toUserEntity(data.token ?? "") ??
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
}
