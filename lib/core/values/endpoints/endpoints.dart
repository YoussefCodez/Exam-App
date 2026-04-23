abstract class Endpoints {

  // base url
  static const String baseUrl = 'https://exam.elevateegy.com';

  // login/out & signup
  static const String signUpUrl = '/api/v1/auth/signup';
  static const String loginUrl = '/api/v1/auth/signin';
  static const String logoutUrl = '/api/v1/auth/logout';

  // password & verification
  static const String changePasswordUrl = '/api/v1/auth/changePassword';
  static const String forgotPasswordUrl = '/api/v1/auth/forgotPassword';
  static const String resetPasswordUrl = '/api/v1/auth/resetPassword';
  static const String verifyResetCodeUrl = '/api/v1/auth/verifyResetCode';

  // account
  static const String getLoggedUserInfo = '/api/v1/auth/profileData';
  static const String editProfileUrl = '/api/v1/auth/editProfile';
  static const String deleteMyAccountUrl = '/api/v1/auth/deleteMe';

}