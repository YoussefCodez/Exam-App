import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/features/reset_password/data/data_sources/new_password_data_sources_contract.dart';
import 'package:exam/features/reset_password/data/models/new_password_response.dart';
import 'package:exam/features/reset_password/domain/repo/new_password_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: NewPasswordRepoContract)
class NewPasswordRepoImpl implements NewPasswordRepoContract {
  NewPasswordDataSourcesContract newPasswordDataSourcesContract;
  NewPasswordRepoImpl(this.newPasswordDataSourcesContract);

  @override
  Future<BaseResponse<NewPasswordResponse>> newPassword(String email,String newPassword,) async {
    final response = await newPasswordDataSourcesContract.newPassword(email,newPassword);
    switch (response) {
      case SuccessBaseResponse<NewPasswordResponse>():
        return SuccessBaseResponse(data: response.data);
      case ErrorBaseResponse<NewPasswordResponse>():
        return ErrorBaseResponse(
          message: response.message,
          code: response.code,
        );
    }
  }
}
