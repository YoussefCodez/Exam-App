import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/core/values/change_password/change_password_titles.dart';
import 'package:exam/features/change_password/data/data_sources/change_password_data_sources_contract.dart';
import 'package:exam/features/change_password/data/models/responses/change_password_response.dart';
import 'package:exam/features/change_password/domain/repo/change_password_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ChangePasswordRepoContract)
class ChangePasswordRepoImpl implements ChangePasswordRepoContract {
  final ChangePasswordDataSourcesContract dataSourcesContract;
  ChangePasswordRepoImpl(this.dataSourcesContract);

  @override
  Future<BaseResponse<String>> changePassword({
    required String token,
    required String oldPassword,
    required String password,
    required String rePassword,
  }) async {
    
    final response = await dataSourcesContract.changePassword(
      token: token,
      oldPassword: oldPassword,
      password: password,
      rePassword: rePassword,
    );

    switch (response) {
      case SuccessBaseResponse<ChangePasswordResponse>():
        return SuccessBaseResponse<String>(
          data: null,
          message: ChangePasswordTitles.success,
          token: response.token,
        );
      case ErrorBaseResponse<ChangePasswordResponse>():
        return ErrorBaseResponse<String>(
          code: response.code,
          message: ChangePasswordTitles.failed,
        );
    }
  }
}
