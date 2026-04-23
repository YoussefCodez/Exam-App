import 'package:exam/config/di/di.dart';
import 'package:exam/core/app_strings/app_strings.dart';
import 'package:exam/features/exam/presentation/view_models/cubits/answer_number.dart';
import 'package:exam/features/exam/presentation/view_models/cubits/get_all_questions_cubit.dart';
import 'package:exam/features/exam/presentation/view_models/cubits/set_user_answer_per_q.dart';
import 'package:exam/features/exam/presentation/view_models/cubits/user_answer.dart';
import 'package:exam/features/exam/presentation/view_models/states/get_all_questions_event.dart';
import 'package:exam/features/exam/presentation/widgets/exam_body_widget.dart';
import 'package:exam/features/exam/presentation/widgets/exam_timer_widget.dart';
import 'package:exam/features/exam/presentation/widgets/exit_exam_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:exam/features/exam/presentation/view_models/cubits/set_multi_user_answer_per_q.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

class ExamScreen extends StatelessWidget {
  static const routeName = AppStrings.examRoute;
  const ExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AnswerNumberCubit()),
        BlocProvider(create: (_) => UserAnswerCubit()),
        BlocProvider(create: (_) => SetUserAnswerPerQCubit()),
        BlocProvider(create: (_) => SetMultiUserAnswerPerQCubit()),
        BlocProvider(
          create: (_) => getIt<GetAllQuestionsCubit>()
            ..doEvent(GetAllQuestions(id: "69d980147c82914570305df7")),
        ),
      ],
      child: const ExamView(),
    );
  }
}

class ExamView extends StatelessWidget {
  const ExamView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        _showExitDialog(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.exam),
          leading: IconButton(
            onPressed: () => _showExitDialog(context),
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
          actions: const [ExamTimerWidget()],
        ),
        body: const ExamBodyWidget(),
      ),
    );
  }

  void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (contextDialog) => ExitExamDialog(
        onConfirm: () {
          context.read<UserAnswerCubit>().clearAnswers();
          Hive.box('timer').clear();
          Navigator.pop(context);
        },
      ),
    );
  }
}
