abstract class ChangePasswordTitles {
  static const String routeName = '/change_password';
  static const String oldPassword = "oldPassword";
  static const String password = "password";
  static const String rePassword = "rePassword";

  // Response keys
  static const String message = "message";
  static const String token = "token";

  // Response values
  static const String success = "success";
  static const String failed = "failed";

  // Screen
  static const String title = "Change Password";
  static const String currentPasswordHint = "Current Password";
  static const String newPasswordHint = "New Password";
  static const String confirmPasswordHint = "Confirm Password";
  static const String update = "Update";
  static const String invalidPassword = "Invalid password";
  static const String notMatchPassword = "Password not matched";
  static const String tokenEmpty = "Token is empty";

  // Alerts
  static const String alertTitle = "Change Password";
  static const String changePasswordSuccess =
      "Your password has been changed successfully.";
  static const String changePasswordFailed = "Failed to change password";
  static const String ok = "OK";
}
