import 'package:exam/features/login/data/models/login_request.dart';
import 'package:exam/features/login/domain/entities/user_entity.dart';
import 'package:exam/features/login/domain/repositories/login_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  final LoginRepoContract loginRepo;

  LoginUseCase(this.loginRepo);

  Future<UserEntity> call(LoginRequest loginRequest) {
    return loginRepo.login(loginRequest);
  } 
}