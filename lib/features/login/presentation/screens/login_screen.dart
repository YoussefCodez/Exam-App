import 'package:exam/core/app_colors/app_colors.dart';
import 'package:exam/core/app_strings/app_strings.dart';
import 'package:exam/features/login/presentation/view_models/cubits/login_cubit.dart';
import 'package:exam/features/login/presentation/view_models/states/login_events.dart';
import 'package:exam/features/reset_password/presentation/screens/forgot_password_screen.dart';
import 'package:exam/features/sign_up/presentation/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../explore/presentation/screens/explore_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = AppStrings.loginRoute;
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = .new();
  late TextEditingController emailController;
  late TextEditingController passwordController;

  String? emailError;
  String? passwordError;

  @override
  void initState() {
    super.initState();
    emailController = .new();
    passwordController = .new();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final loginCubit = context.watch<LoginCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.login, style: theme.textTheme.titleLarge),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    Gap(24.h),
                    TextFormField(
                      controller: emailController,
                      onChanged: (value) {
                        if (emailError != null)
                          setState(() => emailError = null);
                      },
                      decoration: InputDecoration(
                        hintText: AppStrings.enterEmail,
                        labelText: AppStrings.email,
                        errorText: emailError,
                      ),
                    ),
                    Gap(24.h),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      onChanged: (value) {
                        if (passwordError != null)
                          setState(() => passwordError = null);
                      },
                      decoration: InputDecoration(
                        hintText: AppStrings.enterPassword,
                        labelText: AppStrings.password,
                        errorText: passwordError,
                      ),
                    ),
                    Gap(15.h),
                    Row(
                      children: [
                        Checkbox(
                          value: loginCubit.rememberMe,
                          onChanged: (value) {
                            setState(() {
                              loginCubit.doEvent(
                                ToggleRememberMe(),
                                value: value ?? false,
                              );
                            });
                          },
                        ),
                        const Text(AppStrings.rememberMe),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, ResetScreen.routeName);
                          },
                          child: const Text(
                            AppStrings.forgotPassword,
                            style: TextStyle(
                              color: AppColors.black,
                              decoration: .underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(24.h),
                    BlocConsumer<LoginCubit, LoginState>(
                      listener: (context, state) {
                        if (state is LoginLoading) {
                          setState(() {
                            emailError = null;
                            passwordError = null;
                          });
                        } else if (state is LoginSuccess) {
                          Navigator.pushNamed(context, ExploreScreen.routeName);
                        } else if (state is LoginFailure) {
                          final msg = state.message.toLowerCase();
                          setState(() {
                            if (msg.contains(AppStrings.emailLabel)) {
                              emailError = state.message;
                            } else if (msg.contains(AppStrings.passwordLabel)) {
                              passwordError = state.message;
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(state.message),
                                  backgroundColor: AppColors.error,
                                ),
                              );
                            }
                          });
                        }
                      },
                      builder: (context, state) {
                        return state is LoginLoading
                            ? const Center(child: CircularProgressIndicator())
                            : SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (!_formKey.currentState!.validate()) {
                                      return;
                                    }
                                    context.read<LoginCubit>().doEvent(
                                      Login(),
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  },
                                  child: const Text(AppStrings.loginButton),
                                ),
                              );
                      },
                    ),
                    Gap(15.h),
                    Row(
                      mainAxisAlignment: .center,
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
                              decoration: .underline,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
