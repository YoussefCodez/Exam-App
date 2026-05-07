import 'package:flutter_bloc/flutter_bloc.dart';

class SetMultiUserAnswerPerQCubit extends Cubit<List<String>> {
  SetMultiUserAnswerPerQCubit() : super([]);

  void toggleAnswer(String answerKey) {
    List<String> newState = List.from(state);
    if (newState.contains(answerKey)) {
      newState.remove(answerKey);
    } else {
      newState.add(answerKey);
    }
    emit(newState);
  }

  void setAnswers(List<String> answers) {
    emit(answers);
  }

  void clear() {
    emit([]);
  }
}
