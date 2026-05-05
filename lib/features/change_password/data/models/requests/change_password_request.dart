import 'package:exam/core/values/change_password/change_password_titles.dart';

class ChangePasswordRequest {
  final String oldPassword;
  final String password;
  final String rePassword;

  ChangePasswordRequest({
    required this.oldPassword,
    required this.password,
    required this.rePassword,
  });

  Map<String, String> toJson() => {
    ChangePasswordTitles.oldPassword: oldPassword,
    ChangePasswordTitles.password: password,
    ChangePasswordTitles.rePassword: rePassword,
  };
}