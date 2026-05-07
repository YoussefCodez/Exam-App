import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import '../di/di.dart';
import '../../features/exam/domain/entities/question_entity.dart';
import '../../features/exam/domain/entities/subject_entity.dart';
import '../../features/exam/presentation/screens/score_screen.dart';
import '../../features/exam/presentation/view_models/cubits/user_answer.dart';
import '../../features/result/domain/entities/past_exam_entity.dart';
import '../../features/result/domain/mappers/result_mapper.dart';
import '../../features/result/presentation/view_models/result_cubit/result_cubit.dart';

class ExamUtils {
  static void finishExam({
    required BuildContext context,
    required List<QuestionEntity> questions,
    required String id,
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

    final results = ResultMapper.mapToResultItems(
      questions: questions,
      userAnswers: userAnswersList,
    );

    int timeTakenMinutes = 0;
    if (Hive.isBoxOpen('timer')) {
      final timerBox = Hive.box('timer');
      final remainingSeconds = timerBox.get('remaining_seconds') as int?;
      if (remainingSeconds != null && questions.isNotEmpty) {
        final totalSeconds = questions.first.exam.duration * 60;
        timeTakenMinutes = ((totalSeconds - remainingSeconds) / 60).ceil();
      }
    }

    if (questions.isNotEmpty) {
      final pastExam = PastExamEntity(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        examTitle: "Exam ${questions.first.exam.title}", 
        subject: questions.first.subject ?? SubjectEntity(id: '0', name: 'General', icon: 'https://exam.elevateegy.com/uploads/categories/seeder-math.png'),
        durationMinutes: questions.first.exam.duration,
        totalQuestions: questions.length,
        correctAnswers: correctAnswers,
        timeTakenMinutes: timeTakenMinutes,
        createdAt: DateTime.now(),
        results: results,
      );
      
      getIt<ResultCubit>().saveExam(pastExam);
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ScoreScreen(
          totalQuestions: questions.length,
          correctAnswers: correctAnswers,
          results: results,
          id: id,
        ),
      ),
    );

    context.read<UserAnswerCubit>().clearAnswers();
    if (Hive.isBoxOpen('timer')) {
      Hive.box('timer').clear();
    }
  }
}
