import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entities/question_entity.dart';
import '../../../../core/app_strings/app_strings.dart';
import 'radio_select_answer.dart';
import 'checkbox_select_answer.dart';

class QuestionBody extends StatelessWidget {
  final QuestionEntity question;

  const QuestionBody({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question.question,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 28.h),
        if (question.type == AppStrings.singleChoice)
          RadioSelectAnswer(answers: question.answers)
        else
          CheckboxSelectAnswer(answers: question.answers),
      ],
    );
  }
}
