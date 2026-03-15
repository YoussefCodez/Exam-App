import 'package:exam/core/themes/app_colors.dart';
import 'package:exam/features/login/presentation/view_models/cubits/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
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
      appBar: AppBar(title: Text('Login', style: theme.textTheme.titleLarge)),
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
                        hintText: 'Enter your email',
                        labelText: 'Email',
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
                        hintText: 'Enter your password',
                        labelText: 'Password',
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
                              loginCubit.toggleRememberMe(value ?? false);
                            });
                          },
                        ),
                        const Text('Remember me'),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.black,
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
                          print("Login Success for: ${state.user.name}");
                        } else if (state is LoginFailure) {
                          final msg = state.message.toLowerCase();
                          setState(() {
                            if (msg.contains("email")) {
                              emailError = state.message;
                            } else if (msg.contains("password")) {
                              passwordError = state.message;
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(state.message),
                                  backgroundColor: Colors.red,
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
                                    context.read<LoginCubit>().login(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  },
                                  child: const Text('Login'),
                                ),
                              );
                      },
                    ),
                    Gap(15.h),
                    Row(
                    mainAxisAlignment: .center,
                      children: [
                        const Text('Don\'t have an account?'),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Sign Up',
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
