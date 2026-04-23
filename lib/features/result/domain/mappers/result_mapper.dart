import 'package:exam/features/exam/domain/entities/question_entity.dart';
import 'package:exam/features/result/domain/entities/result_item_entity.dart';

abstract class ResultMapper {
  static List<ResultItemEntity> mapToResultItems({
    required List<QuestionEntity> questions,
    required List<String> userAnswers,
  }) {
    return List.generate(questions.length, (index) {
      return ResultItemEntity(
        question: questions[index],
        userAnswer: index < userAnswers.length ? userAnswers[index] : '',
      );
    });
  }
}
