import 'package:bloc/bloc.dart';
import 'package:exam/features/login/data/models/login_request.dart';
import 'package:exam/features/login/domain/entities/user_entity.dart';
import 'package:exam/features/login/domain/use_cases/login_use_case.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart'; // مهم للـ DI
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

  void toggleRememberMe(bool value) {
    rememberMe = value;
  }

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());

    try {
      final request = LoginRequest(email: email, password: password);

      final userEntity = await _loginUseCase.call(request);

      await _secureStorage.write(key: 'token', value: userEntity.token);

      if (rememberMe) {
        await _sharedPreferences.setString('saved_email', email);
        await _sharedPreferences.setBool('remember_me', true);
      } else {
        await _sharedPreferences.remove('saved_email');
        await _sharedPreferences.setBool('remember_me', false);
      }

      emit(LoginSuccess(user: userEntity));
    } catch (e) {
      emit(LoginFailure(message: e.toString()));
    }
  }

  void loadSavedAccount() {
    final email = _sharedPreferences.getString('saved_email');
    final isRemembered = _sharedPreferences.getBool('remember_me') ?? false;
    if (isRemembered && email != null) {
      rememberMe = true;
    }
  }

  String? getSavedEmail() {
    return _sharedPreferences.getString('saved_email');
  }
}
