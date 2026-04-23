import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/features/exam/domain/entities/question_entity.dart';

abstract class GetAllQuestionsContract {
  Future<BaseResponse<List<QuestionEntity>>> getAllQuestions(String id);
}
