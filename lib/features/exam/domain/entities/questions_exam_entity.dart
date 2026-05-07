import 'question_entity.dart';

class QuestionsExamEntity {
  final String message;
  final List<QuestionEntity> questions;

  QuestionsExamEntity({
    required this.message,
    required this.questions,
  });
}
