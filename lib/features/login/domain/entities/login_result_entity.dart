import 'package:exam/features/login/domain/entities/user_entity.dart';

class LoginResultEntity {
  final String token;
  final UserEntity user;

  LoginResultEntity({required this.token, required this.user});
}