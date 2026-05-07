import 'package:exam/core/app_strings/app_strings.dart';
import 'package:exam/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExitExamDialog extends StatelessWidget {
  const ExitExamDialog({super.key, required this.onConfirm});
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      backgroundColor: AppColors.white,
      elevation: 5,
      title: Column(
        children: [
          CircleAvatar(
            radius: 30.r,
            backgroundColor: AppColors.error.withValues(alpha: 0.1),
            child: Icon(
              Icons.warning_amber_rounded,
              color: AppColors.error,
              size: 35.r,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            AppStrings.exitExam,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.darkBlue,
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      content: Text(
        AppStrings.exitExamContent,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.grey,
            ),
        textAlign: TextAlign.center,
      ),
      actionsPadding: REdgeInsets.symmetric(horizontal: 16, vertical: 16),
      actions: [
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: REdgeInsets.symmetric(vertical: 12),
                  side: BorderSide(color: AppColors.lightGrey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                child: Text(
                  AppStrings.cancel,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppColors.grey,
                      ),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.error,
                  padding: REdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  onConfirm();
                },
                child: Text(
                  AppStrings.yes,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppColors.white,
                      ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
