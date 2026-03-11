import 'package:exam/config/base_response/base_response.dart';
import '../models/signup_response.dart';

abstract class SignupDataSourcesRemoteContract {
  Future<BaseResponse<SignUpResponse>> addUser();
}