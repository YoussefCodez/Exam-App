import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/features/exam/domain/entities/question_entity.dart';
import 'package:exam/features/exam/domain/repositories/get_all_questions_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllQuestionsUseCase {
  final GetAllQuestionsContract getAllQuestionsContract;
  GetAllQuestionsUseCase({required this.getAllQuestionsContract});
  Future<BaseResponse<List<QuestionEntity>>> call(String id) {
    return getAllQuestionsContract.getAllQuestions(id);
  }
}