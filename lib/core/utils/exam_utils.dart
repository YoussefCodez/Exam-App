import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import '../../features/exam/domain/entities/question_entity.dart';
import '../../features/exam/presentation/screens/score_screen.dart';
import '../../features/exam/presentation/view_models/cubits/user_answer.dart';

class ExamUtils {
  static void finishExam({
    required BuildContext context,
    required List<QuestionEntity> questions,
  }) {
    int correctAnswers = 0;
    final userAnswersList = context.read<UserAnswerCubit>().state;

    for (int i = 0; i < questions.length; i++) {
      if (i < userAnswersList.length) {
        if (userAnswersList[i] == questions[i].correct) {
          correctAnswers++;
        }
      }
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ScoreScreen(
          totalQuestions: questions.length,
          correctAnswers: correctAnswers,
        ),
      ),
    );

    context.read<UserAnswerCubit>().clearAnswers();
    if (Hive.isBoxOpen('timer')) {
      Hive.box('timer').clear();
    }
  }
}
