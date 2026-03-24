import 'package:exam/features/login/data/models/login_request.dart';
import 'package:exam/features/login/domain/entities/user_entity.dart';

abstract class LoginRepoContract {
  Future<UserEntity> login(LoginRequest loginRequest);
}