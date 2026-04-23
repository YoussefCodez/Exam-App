import 'package:exam/core/app_strings/app_strings.dart';
import 'package:exam/features/exam/domain/entities/question_entity.dart';
import 'package:exam/features/exam/presentation/view_models/cubits/answer_number.dart';
import 'package:exam/features/exam/presentation/view_models/cubits/set_multi_user_answer_per_q.dart';
import 'package:exam/features/exam/presentation/view_models/cubits/set_user_answer_per_q.dart';
import 'package:exam/features/exam/presentation/view_models/cubits/user_answer.dart';
import 'package:exam/features/exam/presentation/widgets/navigation_buttons.dart';
import 'package:exam/features/exam/presentation/widgets/question_body.dart';
import 'package:exam/features/exam/presentation/widgets/question_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionWidget extends StatefulWidget {
  final List<QuestionEntity> questions;

  const QuestionWidget({super.key, required this.questions});

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  @override
  void initState() {
    super.initState();
    _syncAnswers(context.read<AnswerNumberCubit>().state);
  }

  void _syncAnswers(int questionIndex) {
    final currentAnswers = context.read<UserAnswerCubit>().state;
    if (questionIndex < currentAnswers.length) {
      final savedAnswer = currentAnswers[questionIndex];
      if (widget.questions[questionIndex].type == AppStrings.singleChoice) {
        context.read<SetUserAnswerPerQCubit>().setUserAnswer(savedAnswer);
      } else {
        context.read<SetMultiUserAnswerPerQCubit>().setAnswers(
              savedAnswer.isEmpty ? [] : savedAnswer.split(","),
            );
      }
    } else {
      context.read<SetUserAnswerPerQCubit>().setUserAnswer("");
      context.read<SetMultiUserAnswerPerQCubit>().clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnswerNumberCubit, int>(
      builder: (context, questionNumber) {
        if (widget.questions.isEmpty) {
          return const Center(
            child: Text("No questions available"),
          );
        }
        final question = widget.questions[questionNumber];
        return Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              QuestionHeader(
                current: questionNumber + 1,
                total: widget.questions.length,
              ),
              SizedBox(height: 28.h),
              QuestionBody(question: question),
              const Spacer(),
              NavigationButtons(
                questionNumber: questionNumber,
                totalQuestions: widget.questions.length,
                questions: widget.questions,
                onSync: _syncAnswers,
              ),
              SizedBox(height: 24.h),
            ],
          ),
        );
      },
    );
  }
}
