import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/features/sign_up/data/repo/signup_repo_impl.dart';
import '../entities/user.dart';

class SignupUseCase {
  SignupUseCase(this.repo);
  final SignupRepoImpl repo;

  Future<BaseResponse<User>> signUp(User user) async{
    final user = await repo.addUser();
    return user;
  }
}


