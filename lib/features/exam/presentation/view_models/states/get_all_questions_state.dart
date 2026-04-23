part of '../cubits/get_all_questions_cubit.dart';

@immutable
sealed class GetAllQuestionsState {}

final class GetAllQuestionsInitial extends GetAllQuestionsState {}

final class GetAllQuestionsLoading extends GetAllQuestionsState {}

final class GetAllQuestionsSuccess extends GetAllQuestionsState {
  final List<QuestionEntity> questions;
  GetAllQuestionsSuccess(this.questions);
}

final class GetAllQuestionsError extends GetAllQuestionsState {
  final String message;
  GetAllQuestionsError(this.message);
}
