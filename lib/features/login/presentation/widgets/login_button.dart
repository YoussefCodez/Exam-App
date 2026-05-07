import 'package:exam/core/app_strings/app_strings.dart';
import 'package:exam/features/login/presentation/view_models/cubits/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LoginButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          current is LoginLoading ||
          current is LoginSuccess ||
          current is LoginFailure ||
          previous is LoginLoading,
      builder: (context, state) {
        if (state is LoginLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onPressed,
            child: const Text(AppStrings.loginButton),
          ),
        );
      },
    );
  }
}
