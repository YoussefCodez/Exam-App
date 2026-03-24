import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/features/sign_up/domain/repo/signup_repo_contract.dart';
import 'package:injectable/injectable.dart';
import '../entities/user.dart';
import '../entities/user_created.dart';

@injectable
class SignupUseCase {
  SignupUseCase(this.repo);
  final SignupRepoContract repo;

  Future<BaseResponse<User>> signUp(UserCreated userCreated) async{
    final user = await repo.addUser(userCreated);
    return user;
  }
}


