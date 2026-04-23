import 'package:exam/features/exam/presentation/widgets/action_button.dart';
import 'package:exam/features/result/presentation/screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_strings/app_strings.dart';
import '../../../../core/themes/app_colors.dart';

import 'package:exam/features/result/domain/entities/result_item_entity.dart';

class ScoreActions extends StatelessWidget {
  final List<ResultItemEntity> results;

  const ScoreActions({super.key, required this.results});

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
                Navigator.pushNamed(
                  context, 
                  ResultScreen.routeName, 
                  arguments: results,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blue,
                padding: REdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              child: const Text(
                AppStrings.showResults,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 24.h),
          ActionButton(
            onTap: () => Navigator.pushNamedAndRemoveUntil(
              context,
              AppStrings.examRoute,
              (route) => false,
            ),
            text: AppStrings.startAgain,
            isOutline: true,
          ),
        ],
      ),
    );
  }
}
