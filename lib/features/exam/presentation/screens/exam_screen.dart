import 'package:exam/config/di/di.dart';
import 'package:exam/core/app_strings/app_strings.dart';
import 'package:exam/features/exam/presentation/view_models/cubits/answer_number.dart';
import 'package:exam/features/exam/presentation/view_models/cubits/get_all_questions_cubit.dart';
import 'package:exam/features/exam/presentation/view_models/cubits/set_user_answer_per_q.dart';
import 'package:exam/features/exam/presentation/view_models/cubits/user_answer.dart';
import 'package:exam/features/exam/presentation/view_models/states/get_all_questions_event.dart';
import 'package:exam/features/exam/presentation/widgets/question_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:exam/features/exam/presentation/view_models/cubits/set_multi_user_answer_per_q.dart';
import 'package:exam/features/exam/presentation/widgets/exit_exam_dialog.dart';

class ExamScreen extends StatelessWidget {
  static const routeName = AppStrings.examRoute;
  const ExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AnswerNumberCubit()),
        BlocProvider(create: (context) => UserAnswerCubit()),
        BlocProvider(create: (context) => SetUserAnswerPerQCubit()),
        BlocProvider(create: (context) => SetMultiUserAnswerPerQCubit()),
      ],
      child: Builder(
        builder: (context) {
          return PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) async {
              if (didPop) return;
              showDialog(
                context: context,
                builder: (contextDialog) => ExitExamDialog(
                  onConfirm: () {
                    context.read<UserAnswerCubit>().clearAnswers();
                    Navigator.pop(context); 
                  },
                ),
              );
            },
            child: Scaffold(
              appBar: AppBar(
                title: Text(AppStrings.exam),
                leading: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (contextDialog) => ExitExamDialog(
                        onConfirm: () {
                          context.read<UserAnswerCubit>().clearAnswers();
                          Navigator.pop(context); // This pops the ExamScreen
                        },
                      ),
                    );
                  },
                  icon: Icon(Icons.arrow_back_ios_new),
                ),
              ),
              body: BlocProvider(
                create: (context) =>
                    getIt<GetAllQuestionsCubit>()..doEvent(GetAllQuestions(id: "6700708d30a3c3c1944a9c60")),
                child: BlocBuilder<GetAllQuestionsCubit, GetAllQuestionsState>(
                  builder: (context, state) {
                    if (state is GetAllQuestionsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is GetAllQuestionsSuccess) {
                      return QuestionWidget(questions: state.questions);
                    } else if (state is GetAllQuestionsError) {
                      return Center(child: Text(state.message));
                    }
                    return const Center(child: Text('ExamScreen'));
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
