import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/features/login/data/models/login_request.dart';
import 'package:exam/features/login/domain/entities/login_result_entity.dart';

abstract interface class LoginRepoContract {
  Future<BaseResponse<LoginResultEntity>> login(LoginRequest loginRequest);
}