import 'package:exam/features/exam/domain/entities/question_entity.dart';

class ResultItemEntity {
  final QuestionEntity question;
  final String userAnswer;

  const ResultItemEntity({
    required this.question,
    required this.userAnswer,
  });

  bool get isCorrect => question.correct == userAnswer;

  bool get isAnswered => userAnswer.isNotEmpty;
}
