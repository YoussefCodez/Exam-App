import 'package:exam/config/base_response/base_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exam/features/login/domain/entities/login_result_entity.dart';
import 'package:exam/features/login/domain/entities/user_entity.dart';
import 'package:exam/features/login/domain/use_cases/login_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part '../states/login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  bool rememberMe = false;

  LoginCubit(this._loginUseCase) : super(LoginInitial());

  Future<void> toggleRememberMe(bool value) async {
    rememberMe = value;
    emit(LoginInitial());
  }

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());

    try {
      final response = await _loginUseCase.call(email, password);

      switch (response) {
        case SuccessBaseResponse<LoginResultEntity>(data: final userEntity):
          await _loginUseCase.saveToken(userEntity!.token);

          if (rememberMe) {
            await _loginUseCase.saveUserCredentials(email, true);
          } else {
            await _loginUseCase.clearUserCredentials();
          }

          emit(LoginSuccess(user: userEntity.user));
        case ErrorBaseResponse<LoginResultEntity>(message: final message):
          emit(LoginFailure(message: message));
      }
    } catch (e) {
      emit(LoginFailure(message: e.toString()));
    }
  }

  void loadSavedAccount() {
    rememberMe = _loginUseCase.getRememberMeStatus();
  }

  String? getSavedEmail() {
    return _loginUseCase.getSavedEmail();
  }
}
