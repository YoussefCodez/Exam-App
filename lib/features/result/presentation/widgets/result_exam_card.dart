import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/app_colors.dart';

class ResultExamCard extends StatelessWidget {
  final String title;
  final int questionsCount;
  final int durationMinutes;
  final int correctAnswers;
  final int totalTimeTaken;
  final Widget icon;

  const ResultExamCard({
    super.key,
    required this.title,
    required this.questionsCount,
    required this.durationMinutes,
    required this.correctAnswers,
    required this.totalTimeTaken,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.only(bottom: 16),
      padding: REdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: const Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 60.w,
            height: 60.w,
            child: icon,
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      "$durationMinutes Minutes",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  "$questionsCount Question",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  "$correctAnswers corrected answers in $totalTimeTaken min.",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
