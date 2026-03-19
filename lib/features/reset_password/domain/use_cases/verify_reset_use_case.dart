import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/features/reset_password/data/models/verify_reset_response.dart';
import 'package:exam/features/reset_password/domain/repo/verify_reset_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifyResetUseCase {
  final VerifyResetRepoContract repoContract;

  VerifyResetUseCase(this.repoContract);

  Future<BaseResponse<VerifyResetResponse>> verifyResetCode(String code) async {
    return await repoContract.verifyResetCode(code);
  }
}
