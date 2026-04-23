import 'package:injectable/injectable.dart';
import '../entities/past_exam_entity.dart';
import '../repositories/result_repository.dart';

@injectable
class SavePastExamUseCase {
  final ResultRepository repository;
  SavePastExamUseCase(this.repository);
  
  Future<void> call(PastExamEntity exam) async {
    return repository.saveExamResult(exam);
  }
}
