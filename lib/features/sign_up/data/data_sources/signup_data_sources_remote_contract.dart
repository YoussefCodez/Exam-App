import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/features/sign_up/domain/entities/user_created.dart';
import '../models/signup_response.dart';

abstract class SignupDataSourcesRemoteContract {
  Future<BaseResponse<SignUpResponse>> addUser(UserCreated user);
}