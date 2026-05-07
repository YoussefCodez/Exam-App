import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/features/login/domain/entities/login_result_entity.dart';
import 'package:exam/features/login/domain/repositories/login_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  final LoginRepoContract loginRepo;

  LoginUseCase(this.loginRepo);

  Future<BaseResponse<LoginResultEntity>> call(String email, String password) {
    return loginRepo.login(email, password);
  }

  Future<void> saveToken(String token) => loginRepo.saveToken(token);
  
  Future<void> saveUserCredentials(String email, bool rememberMe) =>
      loginRepo.saveUserCredentials(email, rememberMe);
      
  Future<void> clearUserCredentials() => loginRepo.clearUserCredentials();
  
  String? getSavedEmail() => loginRepo.getSavedEmail();
  
  bool getRememberMeStatus() => loginRepo.getRememberMeStatus();
}