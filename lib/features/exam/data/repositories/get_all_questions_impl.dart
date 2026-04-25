import 'package:dio/dio.dart';
import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/config/dio/dio_error_handler.dart';
import 'package:exam/core/network/network_info.dart';
import 'package:exam/features/exam/api/local_data_source/exam_local_data_source.dart';
import 'package:exam/features/exam/api/remote_data_source/exam_api_client.dart';
import 'package:exam/features/exam/domain/entities/question_entity.dart';
import 'package:exam/features/exam/domain/repositories/get_all_questions_contract.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetAllQuestionsContract)
class GetAllQuestionsImpl implements GetAllQuestionsContract {
  final ExamApiClient examApiClient;
  final ExamLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  GetAllQuestionsImpl({
    required this.examApiClient,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<BaseResponse<List<QuestionEntity>>> getAllQuestions(String subjectId) async {
    if (await networkInfo.isConnected) {
      try {
        final examsResponse = await examApiClient.getExams(subjectId);
        
        if (examsResponse.exams == null || examsResponse.exams!.isEmpty) {
          return ErrorBaseResponse(message: 'No exams found for this subject', code: 404);
        }
        
        final examId = examsResponse.exams!.first.id;

        final responseModel = await examApiClient.getQuestions(examId);
        await localDataSource.cacheQuestions(responseModel);
        
        final resultEntity = responseModel.toEntity();
        return SuccessBaseResponse(
          data: resultEntity.questions.toList(),
          message: resultEntity.message,
        );
      } on DioException catch (e) {
        return ErrorBaseResponse(
          message: DioErrorHandler.handle(e),
          code: DioErrorHandler.getStatusCode(e) ?? 0,
        );
      } catch (e) {
        debugPrint(e.toString());
        return ErrorBaseResponse(message: 'Unexpected error: ${e.toString()}', code: 5);
      }
    } else {
      final cachedModel = await localDataSource.getCachedQuestions();
      if (cachedModel != null) {
        final resultEntity = cachedModel.toEntity();
        return SuccessBaseResponse(
          data: resultEntity.questions.toList(),
          message: "Cached Data Shown",
        );
      } else {
        return ErrorBaseResponse(
          message: "No Internet Connection and No Cached Data",
          code: 0,
        );
      }
    }
  }
}
