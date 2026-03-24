import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/features/reset_password/data/data_sources/forgot_password_data_sources_contract.dart';
import 'package:exam/features/reset_password/data/models/forgot_password_response.dart';
import 'package:exam/features/reset_password/data/models/new_password_response.dart';
import 'package:exam/features/reset_password/data/models/verify_reset_response.dart';
import 'package:exam/features/reset_password/domain/repo/forgot_password_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForgotPasswordRepoContract)
class ForgotPasswordRepoImpl implements ForgotPasswordRepoContract {
  final ForgotPasswordDataSourcesContract dataContract;
  ForgotPasswordRepoImpl(this.dataContract);

  @override
  Future<BaseResponse<ForgotPasswordResponse>> forgotPassword(String email) async {
    final response = await dataContract.forgotPassword(email);
    switch (response) {
      case SuccessBaseResponse<ForgotPasswordResponse>():
        return SuccessBaseResponse(data: response.data);
      case ErrorBaseResponse<ForgotPasswordResponse>():
        return ErrorBaseResponse(
          message: response.message,
          code: response.code,
        );
    }
  }
  
  @override
  Future<BaseResponse<NewPasswordResponse>> newPassword(String email, String newPassword) async{
    final response = await dataContract.newPassword(email,newPassword);
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
  
  @override
  Future<BaseResponse<VerifyResetResponse>> verifyResetCode(String code) async {
        final response = await dataContract.verifyResetCode(code);
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
