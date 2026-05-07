import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/entities/past_exam_entity.dart';
import '../../../domain/use_cases/get_past_exams_use_case.dart';
import '../../../domain/use_cases/save_past_exam_use_case.dart';

part 'result_state.dart';

@injectable
class ResultCubit extends Cubit<ResultState> {
  final GetPastExamsUseCase getPastExamsUseCase;
  final SavePastExamUseCase savePastExamUseCase;

  ResultCubit(this.getPastExamsUseCase, this.savePastExamUseCase) : super(ResultInitial());

  Future<void> loadPastExams() async {
    emit(ResultLoading());
    try {
      final exams = await getPastExamsUseCase();
      emit(ResultLoaded(exams));
    } catch (e) {
      emit(ResultError(e.toString()));
    }
  }

  Future<void> saveExam(PastExamEntity exam) async {
    await savePastExamUseCase(exam);
    loadPastExams();
  }
}
