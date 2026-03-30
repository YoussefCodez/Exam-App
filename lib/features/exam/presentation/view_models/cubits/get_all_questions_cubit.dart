import 'package:exam/config/base_response/base_response.dart';
import 'package:exam/features/exam/domain/entities/question_entity.dart';
import 'package:exam/features/exam/domain/use_cases/get_all_questions_use_case.dart';
import 'package:exam/features/exam/presentation/view_models/states/get_all_questions_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part '../states/get_all_questions_state.dart';

@injectable
class GetAllQuestionsCubit extends Cubit<GetAllQuestionsState> {
  final GetAllQuestionsUseCase getAllQuestionsUseCase;
  GetAllQuestionsCubit({required this.getAllQuestionsUseCase}) : super(GetAllQuestionsInitial());

  void doEvent(GetAllQuestionsEvent event) {
    if (event is GetAllQuestions) {
      getAllQuestions(event.id);
    }
  }

  Future<void> getAllQuestions(String id) async {
    emit(GetAllQuestionsLoading());
    try {
      final result = await getAllQuestionsUseCase.call(id);
      if (result is SuccessBaseResponse<List<QuestionEntity>>) {
        emit(GetAllQuestionsSuccess(result.data));
      } else  if (result is ErrorBaseResponse){
        final errorResult = result as ErrorBaseResponse; 
        emit(GetAllQuestionsError(errorResult.message));
      }
    } catch (e) {
      emit(GetAllQuestionsError(e.toString()));
    }
  }
}
