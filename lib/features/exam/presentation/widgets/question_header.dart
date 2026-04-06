import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_strings/app_strings.dart';
import 'progress_bar.dart';

class QuestionHeader extends StatelessWidget {
  final int current;
  final int total;

  const QuestionHeader({super.key, required this.current, required this.total});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            "${AppStrings.question} $current ${AppStrings.of} $total",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        SizedBox(height: 8.h),
        ProgressBar(
          answeredQuestions: current - 1,
          totalQuestions: total,
        ),
      ],
    );
  }
}
