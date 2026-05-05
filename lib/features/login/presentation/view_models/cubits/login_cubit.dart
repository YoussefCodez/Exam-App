import 'package:exam/features/login/api/local_data_source/login_local_data_source.dart';
import 'package:exam/config/base_response/base_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exam/core/app_strings/app_strings.dart';
import 'package:exam/features/login/data/models/login_request.dart';
import 'package:exam/features/login/domain/entities/login_result_entity.dart';
import 'package:exam/features/login/domain/entities/user_entity.dart';
import 'package:exam/features/login/domain/use_cases/login_use_case.dart';
import 'package:exam/features/login/presentation/view_models/states/login_events.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part '../states/login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;
  final FlutterSecureStorage _secureStorage;
  final LoginLocalDataSource _localDataSource;

  bool rememberMe = false;

  LoginCubit(this._loginUseCase, this._secureStorage, this._localDataSource)
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
        _loadSavedAccount();
      case GetSavedEmail():
        _getSavedEmail();
    }
  }

  Future<void> _toggleRememberMe(bool value) async {
    rememberMe = value;
    emit(LoginInitial());
  }

  Future<void> _login({required String email, required String password}) async {
    emit(LoginLoading());

    try {
      final request = LoginRequest(email: email, password: password);
      final response = await _loginUseCase.call(request);

      switch (response) {
        case SuccessBaseResponse<LoginResultEntity>(data: final userEntity):
          await _secureStorage.write(
            key: AppStrings.tokenKey,
            value: userEntity!.token,
          );

          if (rememberMe) {
            await _localDataSource.saveUserCredentials(email, true);
          } else {
            await _localDataSource.clearUserCredentials();
          }

          emit(LoginSuccess(user: userEntity.user));
        case ErrorBaseResponse<LoginResultEntity>(message: final message):
          emit(LoginFailure(message: message));
      }
    } catch (e) {
      emit(LoginFailure(message: e.toString()));
    }
  }

  void _loadSavedAccount() {
    rememberMe = _localDataSource.getRememberMeStatus();
  }

  String? _getSavedEmail() {
    return _localDataSource.getSavedEmail();
  }
}
