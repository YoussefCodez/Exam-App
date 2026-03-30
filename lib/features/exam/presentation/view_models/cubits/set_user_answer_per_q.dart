import 'package:flutter_bloc/flutter_bloc.dart';

class SetUserAnswerPerQCubit extends Cubit<String> {
  SetUserAnswerPerQCubit() : super("");

  void setUserAnswer(String userAnswer) {
    emit(userAnswer);
  }
}