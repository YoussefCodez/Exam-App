part of 'result_cubit.dart';

abstract class ResultState {}

class ResultInitial extends ResultState {}
class ResultLoading extends ResultState {}
class ResultLoaded extends ResultState {
  final List<PastExamEntity> exams;
  ResultLoaded(this.exams);
}
class ResultError extends ResultState {
  final String message;
  ResultError(this.message);
}
