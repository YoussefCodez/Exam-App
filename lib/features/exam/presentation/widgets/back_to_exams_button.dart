import 'package:exam/features/exam/presentation/widgets/action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_strings/app_strings.dart';
import '../../../../core/themes/app_colors.dart';

class BackToExamsButton extends StatelessWidget {
  const BackToExamsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                //TODO: Navigate to result screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blue,
                padding: REdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              child: const Text(
                AppStrings.backToExams,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 24.h),
          ActionButton(
            onTap: () => Navigator.pushNamedAndRemoveUntil(context, AppStrings.examRoute, (route) => false),
            text: AppStrings.startAgain,
            isOutline: true,
          ),
        ],
      ),
    );
  }
}
