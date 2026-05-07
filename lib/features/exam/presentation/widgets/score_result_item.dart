import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScoreResultItem extends StatelessWidget {
  final String label;
  final int count;
  final Color color;

  const ScoreResultItem({
    super.key,
    required this.label,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20.sp,
            color: color,
          ),
        ),
        Container(
          width: 25.w,
          height: 25.h,
          decoration: BoxDecoration(
            border: Border.all(color: color, width: 2.w),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              "$count",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13.sp,
                color: color,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
