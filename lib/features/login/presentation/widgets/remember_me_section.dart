import 'package:exam/core/app_strings/app_strings.dart';
import 'package:exam/core/themes/app_colors.dart';
import 'package:exam/features/login/presentation/view_models/cubits/login_cubit.dart';
import 'package:exam/features/reset_password/presentation/screens/forgot_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RememberMeSection extends StatelessWidget {
  const RememberMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocSelector<LoginCubit, LoginState, bool>(
          selector: (state) {
            return context.read<LoginCubit>().rememberMe;
          },
          builder: (context, rememberMe) {
            return Checkbox(
              value: rememberMe,
              onChanged: (value) {
                context.read<LoginCubit>().toggleRememberMe(value ?? false);
              },
            );
          },
        ),
        const Text(AppStrings.rememberMe),
        const Spacer(),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, ForgotPasswordEmailPage.routeName);
          },
          child: const Text(
            AppStrings.forgotPassword,
            style: TextStyle(
              color: AppColors.black,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
