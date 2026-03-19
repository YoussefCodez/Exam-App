import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/features/reset_password/data/models/new_password_response.dart';
import 'package:exam/features/reset_password/domain/repo/new_password_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class NewPasswordUseCase {
  final NewPasswordRepoContract repoContract;

  NewPasswordUseCase(this.repoContract);

  Future<BaseResponse<NewPasswordResponse>> newPassword(
    String email,
    String newPassword,
  ) async {
    return await repoContract.newPassword(email, newPassword);
  }
}
