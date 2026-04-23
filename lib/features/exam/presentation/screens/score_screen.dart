import 'package:exam/core/app_strings/app_strings.dart';
import 'package:exam/core/themes/app_colors.dart';
import 'package:exam/features/exam/presentation/widgets/score_actions.dart';
import 'package:exam/features/exam/presentation/widgets/score_overview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:exam/features/result/domain/entities/result_item_entity.dart';

class ScoreScreen extends StatelessWidget {
  final int totalQuestions;
  final int correctAnswers;
  final List<ResultItemEntity> results;

  const ScoreScreen({
    super.key,
    required this.totalQuestions,
    required this.correctAnswers,
    required this.results,
  });

  @override
  Widget build(BuildContext context) {
    final wrongAnswers = totalQuestions - correctAnswers;
    final percentage = totalQuestions > 0
        ? (correctAnswers / totalQuestions) * 100
        : 0.0;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.examScore,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20.sp,
            color: AppColors.black,
          ),
        ),
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            SizedBox(height: 24.h),
            Text(
              AppStrings.yourScore,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: 24.h),
            ScoreOverview(
              percentage: percentage,
              correctCount: correctAnswers,
              wrongCount: wrongAnswers,
            ),
            SizedBox(height: 80.h),
            ScoreActions(results: results),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
