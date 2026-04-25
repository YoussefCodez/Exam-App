import 'package:exam/features/explore/domain/use_cases/get_subjects_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../config/base_response/base_response.dart';
import '../../../data/models/subject.dart';
import '../states/explore_events.dart';
import '../states/explore_states.dart';

@injectable
class ExploreViewModel extends Cubit<ExploreStates> {
  final GetSubjectsUseCase _getSubjectsUseCase;
  ExploreViewModel(
      this._getSubjectsUseCase,
      ) : super(ExploreInitial());

  // MVI EVENTS
  void doEvent({required ExploreEvents event}) async {
    if (event is GetSubjectsEvent) {
      _getSubjects();
    }
  }


  void _getSubjects() async {
    emit(ExploreLoading());

    final response = await _getSubjectsUseCase.call();
    switch (response) {
      case SuccessBaseResponse<List<Subject>>():
        emit(ExploreSuccess(response.data));
        break;
      case ErrorBaseResponse<List<Subject>>():
        emit(ExploreError(response.message));
        break;
    }
  }

}
