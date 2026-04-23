import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/app_colors.dart';

class ActionButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool isOutline;

  const ActionButton({
    super.key,
    required this.onTap,
    required this.text,
    this.isOutline = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: REdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isOutline ? AppColors.white : AppColors.blue,
          borderRadius: BorderRadius.circular(10.r),
          border: isOutline ? Border.all(color: AppColors.blue) : null,
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: isOutline ? AppColors.blue : AppColors.white,
          ),
        ),
      ),
    );
  }
}
