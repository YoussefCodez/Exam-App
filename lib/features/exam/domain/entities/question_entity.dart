import 'answer_entity.dart';
import 'exam_entity.dart';

class QuestionEntity {
  final List<AnswerEntity> answers;
  final String type;
  final String id;
  final String question;
  final String correct;
  final String? subject;
  final ExamEntity exam;
  final DateTime createdAt;

  QuestionEntity({
    required this.answers,
    required this.type,
    required this.id,
    required this.question,
    required this.correct,
    this.subject,
    required this.exam,
    required this.createdAt,
  });
}
