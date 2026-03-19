import 'package:exam/config/di/di.dart';
import 'package:exam/core/themes/app_colors.dart';
import 'package:exam/features/reset_password/presentation/view_model/cubit/reset_view_model.dart';
import 'package:exam/features/reset_password/presentation/view_model/states/reset_events.dart';
import 'package:exam/features/reset_password/presentation/view_model/states/reset_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_validator_mate/password_validator_mate.dart';

class NewPasswordScreen extends StatefulWidget {
  static const String routeName = '/new_password';

  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();

  final ResetViewModel viewModel = getIt.get<ResetViewModel>();

  @override
  void dispose() {
    passwordTextController.dispose();
    confirmPasswordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String email = ModalRoute.of(context)!.settings.arguments as String;

    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Password'),
          titleSpacing: 0.0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ),
        body: BlocBuilder<ResetViewModel, ResetStates>(
          builder: (context, state) {
            if (state is ResetLoading) {
              return Center(
                child: CircularProgressIndicator(color: AppColors.blue),
              );
            } else if (state is ResetSuccess) {
              return const Center(child: Text('Password Updated'));
            } else if (state is ResetError) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              });
            }

            return Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    'Reset password',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),

                  /// PASSWORD
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: TextFormField(
                      controller: passwordTextController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        hintText: "Enter password",
                      ),
                      onChanged: (_) => setState(() {}),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Password is required';
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: TextFormField(
                      controller: confirmPasswordTextController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Confirm password",
                        hintText: "Confirm password",
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Confirm password is required';
                        }
                        if (value != passwordTextController.text) {
                          return 'Password not matched';
                        }
                        return null;
                      },
                    ),
                  ),

                  /// PASSWORD VALIDATION UI
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: PasswordValidation(
                      password: passwordTextController.text,
                      rules: PasswordValidators.defaultRules(),
                      passColor: AppColors.blue,
                      failedColor: Colors.grey,
                      onValidationChanged: (allPassed, _) {},
                    ),
                  ),

                  /// BUTTON
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                viewModel.doEvent(
                                  event: NewpasswordEvent(),
                                  email: email,
                                  newPassword: passwordTextController.text
                                      .trim(),
                                );

                                print("password updated successfully");
                                // show that password updated successfully then delay and go back to login
                              }
                            },
                            child: const Text("Continue"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
