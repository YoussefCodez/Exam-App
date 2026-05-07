import 'package:email_validator/email_validator.dart';
import 'package:exam/core/colors/app_colors.dart';
import 'package:exam/core/values/profile/profile_titles.dart';
import 'package:exam/core/values/reset_password/forgot_password_titles.dart';

import 'package:exam/features/reset_password/presentation/screens/verification_screen.dart';
import 'package:exam/features/reset_password/presentation/view_model/cubit/reset_view_model.dart';
import 'package:exam/features/reset_password/presentation/view_model/states/reset_events.dart';
import 'package:exam/features/reset_password/presentation/view_model/states/reset_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/di/di.dart';
import 'package:flutter/material.dart';

class ForgotPasswordEmailPage extends StatefulWidget {
  static const String routeName = ForgotPasswordTitles.forgotPasswordScreen;
  const ForgotPasswordEmailPage({super.key});

  @override
  State<ForgotPasswordEmailPage> createState() =>
      _ForgotPasswordEmailPageState();
}

class _ForgotPasswordEmailPageState extends State<ForgotPasswordEmailPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailTextController = TextEditingController();

  final ResetViewModel viewModel = getIt.get<ResetViewModel>();

  @override
  void dispose() {
    emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(ForgotPasswordTitles.password),
          titleSpacing: 0.0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),

              Text(
                ForgotPasswordTitles.forgotPassword,
                style: Theme.of(context).textTheme.titleMedium,
              ),

              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  ForgotPasswordTitles.assosciatedEmail,
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ),

              /// EMAIL FIELD
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: TextFormField(
                  controller: emailTextController,
                  decoration: const InputDecoration(
                    labelText: ForgotPasswordTitles.email,
                    hintText: ForgotPasswordTitles.enterEmail,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return ForgotPasswordTitles.emailRequired;
                    }
                    if (!EmailValidator.validate(value.trim())) {
                      return ForgotPasswordTitles.notValidEmail;
                    }
                    return null;
                  },
                ),
              ),

              const SizedBox(height: 20),

              /// BUTTON
              BlocBuilder<ResetViewModel, ResetStates>(
                builder: (context, state) {
                  if (state is ResetLoading) {
                    return Center(
                      child: CircularProgressIndicator(color: AppColors.blue),
                    );
                  } else if (state is ResetSuccess) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Navigator.pushNamed(
                        context,
                        VerificationScreen.routeName,
                        arguments: ProfileTitles.empty, // empty args
                      );
                    });
                  } else if (state is ResetError) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.message)));
                    });
                  }
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            viewModel.doEvent(
                              event: ForgotPasswordEvent(),
                              email: emailTextController.text.trim(),
                            );
                          }
                        },
                        child: const Text(ForgotPasswordTitles.continueButton),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
