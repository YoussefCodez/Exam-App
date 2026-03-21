sealed class Endpoints {

  // base url
  static const String baseUrl = 'https://exam.elevateegy.com';

  // login/out & signup
  static const String signUpUrl = '$baseUrl/api/v1/auth/signup';
  static const String loginUrl = '$baseUrl/api/v1/auth/signin';
  static const String logoutUrl = '$baseUrl/api/v1/auth/logout';

  // password & verification
  static const String changePasswordUrl = '$baseUrl/api/v1/auth/changePassword';
  static const String forgotPasswordUrl = '$baseUrl/api/v1/auth/forgotPassword';
  static const String resetPasswordUrl = '$baseUrl/api/v1/auth/resetPassword';
  static const String verifyResetCodeUrl = '$baseUrl/api/v1/auth/verifyResetCode';

  // account
  static const String getLoggedUserInfo = '$baseUrl/api/v1/auth/profileData';
  static const String editProfileUrl = '$baseUrl/api/v1/auth/editProfile';
  static const String deleteMyAccountUrl = '$baseUrl/api/v1/auth/deleteMe';

}