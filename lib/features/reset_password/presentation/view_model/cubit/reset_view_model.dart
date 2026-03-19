import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/features/reset_password/data/models/new_password_response.dart';
import 'package:exam/features/reset_password/data/models/forgot_password_response.dart';
import 'package:exam/features/reset_password/data/models/verify_reset_response.dart';
import 'package:exam/features/reset_password/domain/use_cases/new_password_use_case.dart';
import 'package:exam/features/reset_password/domain/use_cases/forgot_password_use_case.dart';
import 'package:exam/features/reset_password/domain/use_cases/verify_reset_use_case.dart';
import 'package:exam/features/reset_password/presentation/view_model/states/reset_events.dart';
import 'package:exam/features/reset_password/presentation/view_model/states/reset_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetViewModel extends Cubit<ResetStates> {
  final ForgotPasswordUseCase _forgotPasswordUseCase;
  final VerifyResetUseCase _verifyResetUseCase;
  final NewPasswordUseCase _newPasswordUseCase;
  ResetViewModel(
    this._forgotPasswordUseCase,
    this._verifyResetUseCase,
    this._newPasswordUseCase,
  ) : super(ResetInitial());

  // MVI EVENTS
  void doEvent({required ResetEvents event,  String? email, String? newPassword, String? code}) async {
    if (event is ForgotPasswordEvent) {
      _forgotPassword(email!);
    }
    if (event is VerifyResetCodeEvent) {
      _verifyResetCode(code!);
    }
    if (event is NewpasswordEvent) {
      _newPassword(email!, newPassword!);
    }
  }


  void _forgotPassword(String email) async {
    emit(ResetLoading());

    final response = await _forgotPasswordUseCase.forgotPassword(email);
    switch (response) {
      case SuccessBaseResponse<ForgotPasswordResponse>():
        emit(ResetSuccess());
        break;
      case ErrorBaseResponse<ForgotPasswordResponse>():
        emit(ResetError(response.message));
        break;
    }
  }

  void _verifyResetCode(String code) async {
    emit(ResetLoading());

    final response = await _verifyResetUseCase.verifyResetCode(code);
    switch (response) {
      case SuccessBaseResponse<VerifyResetResponse>():
        emit(ResetSuccess());
        break;
      case ErrorBaseResponse<VerifyResetResponse>():
        emit(ResetError(response.message));
        break;
    }
  }


    void _newPassword(String email, String newPassword) async {
    emit(ResetLoading());

    final response = await _newPasswordUseCase.newPassword(email, newPassword);
    switch (response) {
      case SuccessBaseResponse<NewPasswordResponse>():
        emit(ResetSuccess());
        break;
      case ErrorBaseResponse<NewPasswordResponse>():
        emit(ResetError(response.message));
        break;
    }
  }
}
