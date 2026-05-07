import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view_models/cubits/get_all_questions_cubit.dart';
import 'count_down_timer.dart';

class ExamTimerWidget extends StatelessWidget {
  const ExamTimerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllQuestionsCubit, GetAllQuestionsState>(
      builder: (context, state) {
        if (state is GetAllQuestionsSuccess) {
          return CountdownScreen(
            minutes: state.questions.first.exam.duration,
            questions: state.questions,
            id: state.questions.first.exam.id,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
