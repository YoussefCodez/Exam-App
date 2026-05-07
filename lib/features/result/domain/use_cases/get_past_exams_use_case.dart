import 'package:injectable/injectable.dart';
import '../entities/past_exam_entity.dart';
import '../repositories/result_repository.dart';

@injectable
class GetPastExamsUseCase {
  final ResultRepository repository;
  GetPastExamsUseCase(this.repository);
  
  Future<List<PastExamEntity>> call() async {
    return repository.getPastExams();
  }
}
