import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/features/login/data/models/login_request.dart';
import 'package:exam/features/login/data/models/user_model.dart';

abstract class LoginDataSourceRemoteContract {
  Future<BaseResponse<UserModel>> login(LoginRequest loginRequest);
}
