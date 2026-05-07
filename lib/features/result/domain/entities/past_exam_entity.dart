import 'package:exam/features/exam/domain/entities/subject_entity.dart';
import 'package:exam/features/result/domain/entities/result_item_entity.dart';

class PastExamEntity {
  final String id;
  final String examTitle;
  final SubjectEntity subject;
  final int durationMinutes;
  final int totalQuestions;
  final int correctAnswers;
  final int timeTakenMinutes;
  final DateTime createdAt;
  final List<ResultItemEntity> results;

  const PastExamEntity({
    required this.id,
    required this.examTitle,
    required this.subject,
    required this.durationMinutes,
    required this.totalQuestions,
    required this.correctAnswers,
    required this.timeTakenMinutes,
    required this.createdAt,
    required this.results,
  });
}
