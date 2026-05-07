import '../../../domain/entities/user.dart';

sealed class SignupStates {}

class SignupInitial extends SignupStates {}

class SignupLoading extends SignupStates {}

class SignupSuccess extends SignupStates {
  final User user;
  SignupSuccess(this.user);
}

class SignupError extends SignupStates {
  final String message;
  SignupError(this.message);
}
