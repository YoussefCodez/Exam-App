import 'package:flutter/material.dart';

import '../../../../core/themes/app_colors.dart';

class UnderlinedText extends StatelessWidget {
  String underlinedText;
  UnderlinedText({super.key,required this.underlinedText});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          underlinedText,
          style: TextStyle(
            color: AppColors.blue,
          ),
        ),
        Positioned(
          bottom: 2,
          left: 0,
          right: 0,
          child: Container(
            height: 1.5,
            color: AppColors.blue,
          ),
        ),
      ],
    );
  }
}
