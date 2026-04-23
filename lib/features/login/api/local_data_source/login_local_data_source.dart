import 'package:exam/core/app_strings/app_strings.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginLocalDataSource {
  Future<void> saveUserCredentials(String email, bool rememberMe);
  Future<void> clearUserCredentials();
  String? getSavedEmail();
  bool getRememberMeStatus();
}

@Injectable(as: LoginLocalDataSource)
class LoginLocalDataSourceImpl implements LoginLocalDataSource {
  final SharedPreferences _sharedPreferences;

  LoginLocalDataSourceImpl(this._sharedPreferences);

  @override
  Future<void> saveUserCredentials(String email, bool rememberMe) async {
    await _sharedPreferences.setString(AppStrings.savedEmailKey, email);
    await _sharedPreferences.setBool(AppStrings.rememberMeKey, rememberMe);
  }

  @override
  Future<void> clearUserCredentials() async {
    await _sharedPreferences.remove(AppStrings.savedEmailKey);
    await _sharedPreferences.setBool(AppStrings.rememberMeKey, false);
  }

  @override
  String? getSavedEmail() {
    return _sharedPreferences.getString(AppStrings.savedEmailKey);
  }

  @override
  bool getRememberMeStatus() {
    return _sharedPreferences.getBool(AppStrings.rememberMeKey) ?? false;
  }
}
