import 'package:exam/core/app_strings/app_strings.dart';
import 'package:exam/core/themes/app_colors.dart';
import 'package:exam/features/sign_up/presentation/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DontHaveAccountSection extends StatelessWidget {
  const DontHaveAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(AppStrings.dontHaveAccount),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              SignUpScreen.routeName,
            );
          },
          child: Text(
            AppStrings.signUp,
            style: TextStyle(
              color: AppColors.blue,
              decoration: TextDecoration.underline,
              fontSize: 16.sp,
            ),
          ),
        ),
      ],
    );
  }
}
