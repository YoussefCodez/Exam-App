import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/features/change_password/domain/repo/change_password_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangePasswordUseCase {
  final ChangePasswordRepoContract repoContract;
  ChangePasswordUseCase(this.repoContract);

  Future<BaseResponse<String>> call({
    required String token,
    required String oldPassword,
    required String password,
    required String rePassword,
  }) async {
    return await repoContract.changePassword(
      token: token,
      oldPassword: oldPassword,
      password: password,
      rePassword: rePassword,
    );
  }
}
