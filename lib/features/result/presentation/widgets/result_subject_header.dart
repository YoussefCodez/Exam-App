import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/app_colors.dart';

class ResultSubjectHeader extends StatelessWidget {
  final String title;

  const ResultSubjectHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(top: 24, bottom: 16),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
      ),
    );
  }
}
