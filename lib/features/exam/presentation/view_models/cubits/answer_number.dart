import 'package:flutter_bloc/flutter_bloc.dart';

class AnswerNumberCubit extends Cubit<int> {
  AnswerNumberCubit() : super(0);
  void changeAnswerNumber(int answerNumber) {
    emit(answerNumber);
  }

  void nextQuestion() {
    emit(state + 1);
  }

  void previousQuestion() {
    emit(state - 1);
  }
}