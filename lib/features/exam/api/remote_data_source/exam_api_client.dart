import 'package:dio/dio.dart';
import 'package:exam/core/values/endpoints.dart';
import 'package:exam/features/exam/data/models/questions_exam_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'exam_api_client.g.dart';

@injectable
@RestApi(baseUrl: Endpoints.baseUrl)
abstract class ExamApiClient {
  @factoryMethod
  factory ExamApiClient(Dio dio) = _ExamApiClient;

  @GET(Endpoints.getQuestionsUrl)
  Future<QuestionsExamModel> getQuestions(
    @Query("exam") String id
  );
}
