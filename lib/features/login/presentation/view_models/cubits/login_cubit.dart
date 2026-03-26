import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exam/core/app_strings/app_strings.dart';
import 'package:exam/features/login/data/models/login_request.dart';
import 'package:exam/features/login/domain/entities/user_entity.dart';
import 'package:exam/features/login/domain/use_cases/login_use_case.dart';
import 'package:exam/features/login/presentation/view_models/states/login_events.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part '../states/login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;
  final FlutterSecureStorage _secureStorage;
  final SharedPreferences _sharedPreferences;

  bool rememberMe = false;

  LoginCubit(this._loginUseCase, this._secureStorage, this._sharedPreferences)
    : super(LoginInitial());

  void doEvent(
    LoginEvents event, {
    String? email,
    String? password,
    bool? value,
  }) async {
    switch (event) {
      case ToggleRememberMe():
        await _toggleRememberMe(value!);
      case Login():
        await _login(email: email!, password: password!);
      case LoadSavedAccount():
        await _loadSavedAccount();
      case GetSavedEmail():
        _getSavedEmail();
    }
  }

  Future<bool> _toggleRememberMe(bool value) async {
    return rememberMe = value;
  }

  Future<void> _login({required String email, required String password}) async {
    emit(LoginLoading());

    try {
      final request = LoginRequest(email: email, password: password);

      final userEntity = await _loginUseCase.call(request);

      await _secureStorage.write(
        key: AppStrings.tokenKey,
        value: userEntity.token,
      );

      if (rememberMe) {
        await _sharedPreferences.setString(AppStrings.savedEmailKey, email);
        await _sharedPreferences.setBool(AppStrings.rememberMeKey, true);
      } else {
        await _sharedPreferences.remove(AppStrings.savedEmailKey);
        await _sharedPreferences.setBool(AppStrings.rememberMeKey, false);
      }

      emit(LoginSuccess(user: userEntity));
    } catch (e) {
      emit(LoginFailure(message: e.toString()));
    }
  }

  Future<void> _loadSavedAccount() async {
    final email = _sharedPreferences.getString(AppStrings.savedEmailKey);
    final isRemembered =
        _sharedPreferences.getBool(AppStrings.rememberMeKey) ?? false;
    if (isRemembered && email != null) {
      rememberMe = true;
    }
  }

  String? _getSavedEmail() {
    return _sharedPreferences.getString(AppStrings.savedEmailKey);
  }
}
