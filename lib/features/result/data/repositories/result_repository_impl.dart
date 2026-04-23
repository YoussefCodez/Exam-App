import 'package:injectable/injectable.dart';
import '../../domain/entities/past_exam_entity.dart';
import '../../domain/repositories/result_repository.dart';

@Singleton(as: ResultRepository)
class ResultRepositoryImpl implements ResultRepository {
  final List<PastExamEntity> _pastExams = [];

  @override
  Future<void> saveExamResult(PastExamEntity exam) async {
    _pastExams.insert(0, exam);
  }

  @override
  Future<List<PastExamEntity>> getPastExams() async {
    return _pastExams;
  }
}
