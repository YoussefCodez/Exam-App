import 'package:exam/core/themes/app_colors.dart';
import 'package:exam/features/exam/domain/entities/question_entity.dart';
import 'package:exam/features/exam/presentation/view_models/cubits/answer_number.dart';
import 'package:exam/features/exam/presentation/view_models/cubits/set_multi_user_answer_per_q.dart';
import 'package:exam/features/exam/presentation/view_models/cubits/set_user_answer_per_q.dart';
import 'package:exam/features/exam/presentation/view_models/cubits/user_answer.dart';
import 'package:exam/features/exam/presentation/widgets/checkbox_select_answer.dart';
import 'package:exam/features/exam/presentation/widgets/progress_bar.dart';
import 'package:exam/features/exam/presentation/widgets/radio_select_answer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({super.key, required this.questions});
  final List<QuestionEntity> questions;

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
    var currentAnswers = context.read<UserAnswerCubit>().state;
    if (questionIndex < currentAnswers.length) {
      String savedAnswer = currentAnswers[questionIndex];
      if (widget.questions[questionIndex].type == "single_choice") {
        context.read<SetUserAnswerPerQCubit>().setUserAnswer(savedAnswer);
      } else {
        context
            .read<SetMultiUserAnswerPerQCubit>()
            .setAnswers(savedAnswer.isEmpty ? [] : savedAnswer.split(","));
      }
    } else {
      context.read<SetUserAnswerPerQCubit>().setUserAnswer("");
      context.read<SetMultiUserAnswerPerQCubit>().clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserAnswerCubit, List<String>>(
      builder: (context, userAnswerState) {
        return BlocBuilder<AnswerNumberCubit, int>(
          builder: (context, questionNumber) {
            return Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: .start,
                crossAxisAlignment: .start,
                children: [
                  Center(
                    child: Text(
                      "Question ${questionNumber + 1} of ${widget.questions.length}",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  ProgressBar(
                    answeredQuestions: questionNumber,
                    totalQuestions: widget.questions.length,
                  ),
                  SizedBox(height: 28.h),
                  Text(
                    widget.questions[questionNumber].question,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: 28.h),
                  if (widget.questions[questionNumber].type == "single_choice")
                    RadioSelectAnswer(
                        answers: widget.questions[questionNumber].answers),
                  if (widget.questions[questionNumber].type ==
                      "multiple_choice")
                    CheckboxSelectAnswer(
                        answers: widget.questions[questionNumber].answers),
                  SizedBox(height: 28.h),
                  Row(
                    children: [
                      if (questionNumber > 0)
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              context
                                  .read<AnswerNumberCubit>()
                                  .previousQuestion();
                              _syncAnswers(questionNumber - 1);
                            },
                            child: Container(
                            alignment: .center,
                              padding: REdgeInsets.symmetric(vertical: 16),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(color: AppColors.blue),
                              ),
                              child: Text(
                                "Back",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: AppColors.blue),
                              ),
                            ),
                          ),
                        ),
                      if (questionNumber > 0) SizedBox(width: 16.w),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            if (questionNumber < widget.questions.length - 1) {
                              String answerToSave = "";
                              if (widget.questions[questionNumber].type ==
                                  "single_choice") {
                                answerToSave = context
                                    .read<SetUserAnswerPerQCubit>()
                                    .state;
                              } else {
                                answerToSave = context
                                    .read<SetMultiUserAnswerPerQCubit>()
                                    .state
                                    .join(",");
                              }

                              context
                                  .read<UserAnswerCubit>()
                                  .addUserAnswer(questionNumber, answerToSave);

                              context.read<AnswerNumberCubit>().nextQuestion();

                              _syncAnswers(questionNumber + 1);
                            }
                          },
                          child: Container(
                            alignment: .center,
                            padding: REdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                              color: AppColors.blue,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Text(
                              "Next",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: AppColors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
