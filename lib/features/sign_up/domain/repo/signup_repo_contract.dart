import 'package:exam/config/base_response/base_response.dart';
import '../entities/user.dart';

abstract class SignupRepoContract {

  Future<BaseResponse<User>> addUser();
}