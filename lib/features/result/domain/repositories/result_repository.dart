import '../entities/past_exam_entity.dart';

abstract class ResultRepository {
  Future<void> saveExamResult(PastExamEntity exam);
  Future<List<PastExamEntity>> getPastExams();
}
