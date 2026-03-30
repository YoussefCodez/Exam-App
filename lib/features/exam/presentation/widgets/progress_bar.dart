import 'package:exam/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressBar extends StatelessWidget {
  final int answeredQuestions;
  final int totalQuestions;

  const ProgressBar({
    super.key,
    required this.answeredQuestions,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    double progress = answeredQuestions / totalQuestions;
    return Container(
      height: 4.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: LinearProgressIndicator(
          value: progress,
          backgroundColor: AppColors.lightGrey,
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.blue),
        ),
      ),
    );
  }
}