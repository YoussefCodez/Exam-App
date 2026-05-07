import 'package:exam/features/exam/presentation/screens/exam_screen.dart';
import 'package:exam/features/exam/presentation/widgets/action_button.dart';
import 'package:exam/features/result/domain/entities/result_item_entity.dart';
import 'package:exam/features/result/presentation/screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_strings/app_strings.dart';
import '../../../../core/themes/app_colors.dart';

class ScoreActions extends StatelessWidget {
  final List<ResultItemEntity> results;
  final String id;

  const ScoreActions({super.key, required this.results, required this.id});

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
            onTap: () {
              print(id);
              Navigator.pushNamedAndRemoveUntil(
                context,
                ExamScreen.routeName,
                arguments: {"id": id},
                (route) => false,
              );
            },
            text: AppStrings.startAgain,
            isOutline: true,
          ),
        ],
      ),
    );
  }
}
