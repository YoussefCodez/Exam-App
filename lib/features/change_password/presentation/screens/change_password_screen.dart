import 'package:exam/config/di/di.dart';
import 'package:exam/core/colors/app_colors.dart';
import 'package:exam/core/values/change_password/change_password_titles.dart';
import 'package:exam/features/change_password/presentation/view_model/cubit/change_password_view_model.dart';
import 'package:exam/features/change_password/presentation/view_model/events/change_password_events.dart';
import 'package:exam/features/change_password/presentation/view_model/states/change_password_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_validator_mate/password_validator_mate.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const String routeName = ChangePasswordTitles.routeName;

  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final currentPasswordTextController = TextEditingController();
  final newPasswordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();

  final ChangePasswordViewModel viewModel = getIt
      .get<ChangePasswordViewModel>();

  @override
  void dispose() {
    currentPasswordTextController.dispose();
    newPasswordTextController.dispose();
    confirmPasswordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ChangePasswordTitles.title),
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
            /// CURRENT PASSWORD
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextFormField(
                controller: currentPasswordTextController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: ChangePasswordTitles.currentPasswordHint,
                  hintText: ChangePasswordTitles.currentPasswordHint,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return ChangePasswordTitles.invalidPassword;
                  }

                  final rules = PasswordValidators.defaultRules();
                  for (var rule in rules) {
                    if (!rule.validator(value)) {
                      return rule.description;
                    }
                  }
                  return null;
                },
              ),
            ),

            /// NEW PASSWORD
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextFormField(
                controller: newPasswordTextController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: ChangePasswordTitles.newPasswordHint,
                  hintText: ChangePasswordTitles.newPasswordHint,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return ChangePasswordTitles.invalidPassword;
                  }

                  final rules = PasswordValidators.defaultRules();
                  for (var rule in rules) {
                    if (!rule.validator(value)) {
                      return rule.description;
                    }
                  }
                  return null;
                },
              ),
            ),

            /// CONFIRM PASSWORD
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextFormField(
                controller: confirmPasswordTextController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: ChangePasswordTitles.confirmPasswordHint,
                  hintText: ChangePasswordTitles.confirmPasswordHint,
                ),
                validator: (value) {
                  if (value != newPasswordTextController.text) {
                    return ChangePasswordTitles.notMatchPassword;
                  }
                  return null;
                },
              ),
            ),

            /// UPDATE BUTTON
            BlocProvider<ChangePasswordViewModel>(
              create: (BuildContext context) => viewModel,
              child: Row(
                children: [
                  Expanded(
                    child:
                        BlocListener<
                          ChangePasswordViewModel,
                          ChangePasswordState
                        >(
                          listener: (context, state) {
                            if (state is ChangePasswordErrorState) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text(
                                      ChangePasswordTitles.alertTitle,
                                    ),
                                    content: Text(
                                      ChangePasswordTitles.changePasswordFailed,
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text(
                                          ChangePasswordTitles.ok,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }

                            if (state is ChangePasswordSuccessState) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text(
                                      ChangePasswordTitles.alertTitle,
                                    ),
                                    content: Text(
                                      ChangePasswordTitles
                                          .changePasswordSuccess,
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          ChangePasswordTitles.ok,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                BlocBuilder<
                                  ChangePasswordViewModel,
                                  ChangePasswordState
                                >(
                                  builder: (BuildContext context, state) {
                                    if (state is ChangePasswordLoadingState) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }

                                    return ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          viewModel.doEvent(
                                            ChangePasswordEvent(),
                                            currentPasswordTextController.text,
                                            newPasswordTextController.text,
                                            confirmPasswordTextController.text,
                                          );
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            AppColors.buttonActiveColor,
                                        foregroundColor: AppColors.white,
                                      ),
                                      child: const Text(
                                        ChangePasswordTitles.update,
                                      ),
                                    );
                                  },
                                ),
                          ),
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
