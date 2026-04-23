import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/app_strings/app_strings.dart';
import '../../../../core/utils/exam_utils.dart';
import '../../domain/entities/question_entity.dart';
import '../view_models/cubits/answer_number.dart';
import '../view_models/cubits/set_multi_user_answer_per_q.dart';
import '../view_models/cubits/set_user_answer_per_q.dart';
import '../view_models/cubits/user_answer.dart';
import 'action_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigationButtons extends StatelessWidget {
  final int questionNumber;
  final int totalQuestions;
  final List<QuestionEntity> questions;
  final Function(int) onSync;

  const NavigationButtons({
    super.key,
    required this.questionNumber,
    required this.totalQuestions,
    required this.questions,
    required this.onSync,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (questionNumber > 0) ...[
          Expanded(
            child: ActionButton(
              onTap: () {
                context.read<AnswerNumberCubit>().previousQuestion();
                onSync(questionNumber - 1);
              },
              text: AppStrings.back,
              isOutline: true,
            ),
          ),
          SizedBox(width: 16.w),
        ],
        Expanded(
          child: ActionButton(
            onTap: () => _handleNext(context),
            text: questionNumber < totalQuestions - 1 ? AppStrings.next : AppStrings.finish,
          ),
        ),
      ],
    );
  }

  void _handleNext(BuildContext context) {
    String answerToSave = "";
    if (questions[questionNumber].type == AppStrings.singleChoice) {
      answerToSave = context.read<SetUserAnswerPerQCubit>().state;
    } else {
      answerToSave = context.read<SetMultiUserAnswerPerQCubit>().state.join(",");
    }

    context.read<UserAnswerCubit>().addUserAnswer(questionNumber, answerToSave);

    if (questionNumber < totalQuestions - 1) {
      context.read<AnswerNumberCubit>().nextQuestion();
      onSync(questionNumber + 1);
    } else {
      ExamUtils.finishExam(context: context, questions: questions);
    }
  }
}
