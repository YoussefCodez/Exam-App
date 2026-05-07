import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/features/login/data/models/login_request.dart';
import 'package:exam/features/login/data/models/login_response.dart';

abstract interface class LoginDataSourceRemoteContract {
  Future<BaseResponse<LoginResponse>> login(LoginRequest loginRequest);
}
