import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/app_strings/app_strings.dart';
import '../view_models/cubits/get_all_questions_cubit.dart';
import 'question_widget.dart';

class ExamBodyWidget extends StatelessWidget {
  const ExamBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllQuestionsCubit, GetAllQuestionsState>(
      builder: (context, state) {
        if (state is GetAllQuestionsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetAllQuestionsSuccess) {
          return QuestionWidget(questions: state.questions);
        } else if (state is GetAllQuestionsError) {
          return Center(child: Text(state.message));
        }
        return const Center(child: Text(AppStrings.exam));
      },
    );
  }
}
