import 'package:exam/core/app_strings/app_strings.dart';
import 'package:exam/core/themes/app_colors.dart';
import 'package:exam/features/home/presentation/screens/home_screen.dart';
import 'package:exam/features/login/presentation/view_models/cubits/login_cubit.dart';
import 'package:exam/features/login/presentation/view_models/states/login_events.dart';
import 'package:exam/features/login/presentation/widgets/dont_have_account_section.dart';
import 'package:exam/features/login/presentation/widgets/login_button.dart';
import 'package:exam/features/login/presentation/widgets/login_email_field.dart';
import 'package:exam/features/login/presentation/widgets/login_password_field.dart';
import 'package:exam/features/login/presentation/widgets/remember_me_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = AppStrings.loginRoute;
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  final ValueNotifier<String?> _emailErrorNotifier = ValueNotifier<String?>(null);
  final ValueNotifier<String?> _passwordErrorNotifier = ValueNotifier<String?>(null);

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailErrorNotifier.dispose();
    _passwordErrorNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.login, style: theme.textTheme.titleLarge),
      ),
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            _emailErrorNotifier.value = null;
            _passwordErrorNotifier.value = null;
          } else if (state is LoginSuccess) {
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          } else if (state is LoginFailure) {
            final msg = state.message.toLowerCase();
            if (msg.contains(AppStrings.emailLabel.toLowerCase())) {
              _emailErrorNotifier.value = state.message;
            } else if (msg.contains(AppStrings.passwordLabel.toLowerCase())) {
              _passwordErrorNotifier.value = state.message;
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: AppColors.error,
                ),
              );
            }
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Gap(24.h),
                  ValueListenableBuilder<String?>(
                    valueListenable: _emailErrorNotifier,
                    builder: (context, error, _) {
                      return LoginEmailField(
                        controller: _emailController,
                        errorText: error,
                        onChanged: (_) {
                          if (error != null) _emailErrorNotifier.value = null;
                        },
                      );
                    },
                  ),
                  Gap(24.h),
                  ValueListenableBuilder<String?>(
                    valueListenable: _passwordErrorNotifier,
                    builder: (context, error, _) {
                      return LoginPasswordField(
                        controller: _passwordController,
                        errorText: error,
                        onChanged: (_) {
                          if (error != null) _passwordErrorNotifier.value = null;
                        },
                      );
                    },
                  ),
                  Gap(15.h),
                  const RememberMeSection(),
                  Gap(24.h),
                  LoginButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<LoginCubit>().doEvent(
                          Login(),
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                      }
                    },
                  ),
                  Gap(15.h),
                  const DontHaveAccountSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
