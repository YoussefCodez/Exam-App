import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/features/login/data/models/login_request.dart';
import 'package:exam/features/login/data/models/user_model.dart';
import 'package:exam/features/login/data/repositories/login_data_source_remote_contract.dart';
import 'package:exam/features/login/domain/entities/user_entity.dart';
import 'package:exam/features/login/domain/repositories/login_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginRepoContract)
class LoginRepoImpl implements LoginRepoContract {
  final LoginDataSourceRemoteContract loginDataSourceRemote;

  LoginRepoImpl({required this.loginDataSourceRemote});

  @override
  Future<UserEntity> login(LoginRequest loginRequest) async {
    final result = await loginDataSourceRemote.login(loginRequest);
    if (result is SuccessBaseResponse<UserModel>) {
      return result.data.user?.toUserEntity(result.data.token ?? "") ??
          UserEntity(
            name: '',
            email: '',
            phone: '',
            token: '',
          );
    } else {
      throw Exception((result as ErrorBaseResponse).message);
    }
  }
}
