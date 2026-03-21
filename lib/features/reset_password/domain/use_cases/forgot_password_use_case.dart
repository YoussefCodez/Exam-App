import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/features/reset_password/data/models/forgot_password_response.dart';
import 'package:exam/features/reset_password/data/models/new_password_response.dart';
import 'package:exam/features/reset_password/data/models/verify_reset_response.dart';
import 'package:exam/features/reset_password/domain/repo/forgot_password_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgotPasswordUseCase {
  final ForgotPasswordRepoContract repoContract;

  ForgotPasswordUseCase(this.repoContract);

  Future<BaseResponse<ForgotPasswordResponse>> forgotPassword(
    String email,
  ) async {
    return await repoContract.forgotPassword(email);
  }

  Future<BaseResponse<VerifyResetResponse>> verifyResetCode(String code) async {
    return await repoContract.verifyResetCode(code);
  }

  Future<BaseResponse<NewPasswordResponse>> newPassword(
    String email,
    String newPassword,
  ) async {
    return await repoContract.newPassword(email, newPassword);
  }
}
