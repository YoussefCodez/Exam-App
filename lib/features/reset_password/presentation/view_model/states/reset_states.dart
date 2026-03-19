sealed class ResetStates {}

class ResetInitial extends ResetStates {}

class ResetLoading extends ResetStates {}

class ResetSuccess extends ResetStates {}

class ResetError extends ResetStates {
  final String message;
  ResetError(this.message);
}
