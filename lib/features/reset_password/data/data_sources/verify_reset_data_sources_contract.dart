import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/features/reset_password/data/models/verify_reset_response.dart';

abstract class VerifyResetDataSourcesContract {
  Future<BaseResponse<VerifyResetResponse>> verifyResetCode(String code);
}
