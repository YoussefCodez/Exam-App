import 'package:exam/features/exam/data/models/questions_exam_model.dart';
import 'package:hive_ce/hive.dart';
import 'package:injectable/injectable.dart';

abstract class ExamLocalDataSource {
  Future<void> cacheQuestions(QuestionsExamModel questionsExamModel);
  Future<QuestionsExamModel?> getCachedQuestions();
}

@Injectable(as: ExamLocalDataSource)
class ExamLocalDataSourceImpl implements ExamLocalDataSource {
  final _boxName = 'exam_box';

  @override
  Future<void> cacheQuestions(QuestionsExamModel questionsExamModel) async {
    final box = Hive.box<QuestionsExamModel>(_boxName);
    await box.put('cached_questions', questionsExamModel);
  }

  @override
  Future<QuestionsExamModel?> getCachedQuestions() async {
    final box = Hive.box<QuestionsExamModel>(_boxName);
    return box.get('cached_questions');
  }
}
