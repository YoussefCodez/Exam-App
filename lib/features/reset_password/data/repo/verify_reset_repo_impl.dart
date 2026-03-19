import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/features/reset_password/data/data_sources/verify_reset_data_sources_contract.dart';
import 'package:exam/features/reset_password/data/models/verify_reset_response.dart';
import 'package:exam/features/reset_password/domain/repo/verify_reset_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: VerifyResetRepoContract)
class VerifyResetRepoImpl implements VerifyResetRepoContract {
  final VerifyResetDataSourcesContract dataSourcesContract;
  VerifyResetRepoImpl(this.dataSourcesContract);

  @override
  Future<BaseResponse<VerifyResetResponse>> verifyResetCode(String code) async {
    final response = await dataSourcesContract.verifyResetCode(code);
    switch (response) {
      case SuccessBaseResponse<VerifyResetResponse>():
        return SuccessBaseResponse(data: response.data);
      case ErrorBaseResponse<VerifyResetResponse>():
        return ErrorBaseResponse(
          message: response.message,
          code: response.code,
        );
    }
  }
}
