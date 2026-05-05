import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/config/di/di.dart';
import 'package:exam/core/app_strings/app_strings.dart';
import 'package:exam/core/values/change_password/change_password_titles.dart';
import 'package:exam/features/change_password/domain/use_cases/change_password_use_case.dart';
import 'package:exam/features/change_password/presentation/view_model/events/change_password_events.dart';
import 'package:exam/features/change_password/presentation/view_model/states/change_password_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangePasswordViewModel extends Cubit<ChangePasswordState> {
  final ChangePasswordUseCase _changePasswordUseCase;

  ChangePasswordViewModel(this._changePasswordUseCase)
    : super(ChangePasswordInitialState());

  void doEvent(
    ChangePasswordEvents event,
    String oldPassword,
    String password,
    String rePassword,
  ) {
    switch (event) {
      case ChangePasswordEvent():
        _changePassword(oldPassword, password, rePassword);
    }
  }

  Future<void> _changePassword(
    String oldPassword,
    String password,
    String rePassword,
  ) async {
    emit(ChangePasswordLoadingState());

    final storage = getIt<FlutterSecureStorage>();
    final token = await storage.read(key: AppStrings.tokenKey);

    if (token == null) {
      emit(ChangePasswordErrorState(ChangePasswordTitles.tokenEmpty));
      return;
    }
    final response = await _changePasswordUseCase.call(
      token: token,
      oldPassword: oldPassword,
      password: password,
      rePassword: rePassword,
    );

    switch (response) {
      case SuccessBaseResponse<String>():
        emit(ChangePasswordSuccessState(response.message!));
        print("I am in success state in view Model and the response message is ${response.message} and the response token is ${response.token}");
      case ErrorBaseResponse<String>():
        emit(ChangePasswordErrorState(response.message));
        print("I am in error state in view Model and the response message is ${response.message} and the response code is ${response.code}");
    }
  }
}
