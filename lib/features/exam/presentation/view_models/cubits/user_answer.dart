import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

class UserAnswerCubit extends Cubit<List<String>> {
  UserAnswerCubit() : super([]) {
    _loadAnswers();
  }

  void _loadAnswers() {
    var box = Hive.box("userAnswers");
    var data = box.get("userAnswers", defaultValue: <String>[]);
    List<String> currentAnswers = List.from(data);
    emit(currentAnswers);
  }

  void clearAnswers() {
    var box = Hive.box("userAnswers");
    box.delete("userAnswers");
    emit([]);
  }

  void addUserAnswer(int index, String userAnswer) {
    List<String> currentAnswers = List.from(state);
    print(currentAnswers);
    if (index < currentAnswers.length) {
      currentAnswers[index] = userAnswer;
      print(currentAnswers);
    } else {
      print(currentAnswers);
      currentAnswers.add(userAnswer);
    }
    var box = Hive.box("userAnswers");
    box.put("userAnswers", currentAnswers);
    emit(currentAnswers);
  }
}