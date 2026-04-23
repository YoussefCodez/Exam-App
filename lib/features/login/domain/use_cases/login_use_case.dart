import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/features/login/data/models/login_request.dart';
import 'package:exam/features/login/domain/entities/login_result_entity.dart';
import 'package:exam/features/login/domain/repositories/login_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  final LoginRepoContract loginRepo;

  LoginUseCase(this.loginRepo);

  Future<BaseResponse<LoginResultEntity>> call(LoginRequest loginRequest) {
    return loginRepo.login(loginRequest);
  } 
}