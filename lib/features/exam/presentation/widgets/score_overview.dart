import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../../core/themes/app_colors.dart';
import 'score_result_item.dart';
import '../../../../core/app_strings/app_strings.dart';

class ScoreOverview extends StatelessWidget {
  final double percentage;
  final int correctCount;
  final int wrongCount;

  const ScoreOverview({
    super.key,
    required this.percentage,
    required this.correctCount,
    required this.wrongCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircularPercentIndicator(
          radius: 50.r,
          lineWidth: 5.w,
          percent: percentage / 100,
          center: Text(
            "${percentage.toStringAsFixed(0)}%",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20.sp,
              color: AppColors.darkGrey,
            ),
          ),
          progressColor: AppColors.blue,
          backgroundColor: AppColors.error,
        ),
        SizedBox(width: 24.w),
        Expanded(
          child: Column(
            children: [
              ScoreResultItem(
                label: AppStrings.correct,
                count: correctCount,
                color: AppColors.blue,
              ),
              SizedBox(height: 16.h),
              ScoreResultItem(
                label: AppStrings.incorrect,
                count: wrongCount,
                color: AppColors.error,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
