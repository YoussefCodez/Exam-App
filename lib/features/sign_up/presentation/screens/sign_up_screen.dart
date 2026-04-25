import 'package:email_validator/email_validator.dart';
import 'package:exam/core/colors/app_colors.dart';
import 'package:exam/core/values/sign_up/signup_screen_titles.dart';
import 'package:exam/features/login/presentation/screens/login_screen.dart';
import 'package:exam/features/sign_up/presentation/view_model/states/signup_events.dart';
import 'package:password_validator_mate/password_validator_mate.dart';
import 'package:exam/features/sign_up/domain/entities/user_created.dart';
import 'package:exam/features/sign_up/presentation/view_model/cubit/signup_view_model.dart';
import 'package:exam/features/sign_up/presentation/view_model/states/signup_states.dart';
import 'package:exam/core/widgets/underlined_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/di/di.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = SignupScreenTitles.routeName;

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final userNameTextController = TextEditingController();
  final firstNameTextController = TextEditingController();
  final lastNameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();
  final phoneTextController = TextEditingController();

  final SignupViewModel viewModel = getIt.get<SignupViewModel>();

  @override
  void dispose() {
    userNameTextController.dispose();
    firstNameTextController.dispose();
    lastNameTextController.dispose();
    emailTextController.dispose();
    passwordTextController.dispose();
    confirmPasswordTextController.dispose();
    phoneTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isValid = _formKey.currentState?.validate() ?? true;

    return BlocProvider(
      create: (context) => viewModel,
      child: BlocListener<SignupViewModel, SignupStates>(
        listener: (context, state) {
          /// SUCCESS POPUP
          if (state is SignupSuccess) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: const Text(SignupScreenTitles.success),
                  content: Text(
                    "${SignupScreenTitles.welcome} ${state.user.firstName}",
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // close dialog
                        Navigator.pop(context); // go back
                      },
                      child: const Text(SignupScreenTitles.ok),
                    ),
                  ],
                );
              },
            );
          }

          /// ERROR POPUP
          if (state is SignupError) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text(SignupScreenTitles.error),
                  content: Text(state.message),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(SignupScreenTitles.ok),
                    ),
                  ],
                );
              },
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            surfaceTintColor: AppColors.darkBlue,
            animateColor: false,
            shadowColor: Colors.transparent,
            elevation: 0.0,
            leading: Padding(
              padding: EdgeInsets.all(16.0),
              child: InkWell(
                child: Icon(Icons.arrow_back_ios),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            title: const Text(SignupScreenTitles.signUp),
            titleSpacing: 0,
          ),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 16),

                  /// USERNAME
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: SignupScreenTitles.username,
                        hintText: SignupScreenTitles.usernameHint,
                      ),
                      controller: userNameTextController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return SignupScreenTitles.usernameRequired;
                        }
                        return null;
                      },
                    ),
                  ),

                  /// FIRST & LAST NAME
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: SignupScreenTitles.firstName,
                              hintText: SignupScreenTitles.firstNameHint,
                            ),
                            controller: firstNameTextController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return SignupScreenTitles.firstNameRequired;
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: SignupScreenTitles.lastName,
                              hintText: SignupScreenTitles.lastNameHint,
                            ),
                            controller: lastNameTextController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return SignupScreenTitles.lastNameRequired;
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),

                  /// EMAIL
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: SignupScreenTitles.email,
                        hintText: SignupScreenTitles.emailHint,
                      ),
                      controller: emailTextController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return SignupScreenTitles.emailRequired;
                        }
                        if (!EmailValidator.validate(value)) {
                          return SignupScreenTitles.emailInvalid;
                        }
                        return null;
                      },
                    ),
                  ),

                  /// PASSWORD + CONFIRM
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: SignupScreenTitles.password,
                              hintText: SignupScreenTitles.passwordHint,
                            ),
                            controller: passwordTextController,
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return SignupScreenTitles.passwordRequired;
                              }

                              final rules = PasswordValidators.defaultRules();
                              PasswordRule? failedRule;
                              for (var rule in rules) {
                                if (!rule.validator(value)) {
                                  failedRule = rule;
                                  break;
                                }
                              }

                              if (failedRule != null) {
                                return failedRule.description;
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: SignupScreenTitles.confirmPassword,
                              hintText: SignupScreenTitles.confirmPasswordHint,
                            ),
                            controller: confirmPasswordTextController,
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return SignupScreenTitles
                                    .confirmPasswordRequired;
                              }
                              if (value != passwordTextController.text) {
                                return SignupScreenTitles.passwordMismatch;
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
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
                      onValidationChanged: (allPassed, _) {
                        // no-op for now, this rebuilds from onChanged above
                      },
                    ),
                  ),

                  /// PHONE
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: SignupScreenTitles.phone,
                        hintText: SignupScreenTitles.phoneHint,
                      ),
                      controller: phoneTextController,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return SignupScreenTitles.phoneRequired;
                        }
                        if (value.length < 11) {
                          return SignupScreenTitles.phoneInvalid;
                        }
                        return null;
                      },
                    ),
                  ),

                  /// SIGNUP BUTTON
                  BlocBuilder<SignupViewModel, SignupStates>(
                    builder: (context, state) {
                      if (state is SignupLoading) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.blue,
                          ),
                        );
                      }

                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isValid
                                ? AppColors.blue
                                : AppColors.grey,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) {
                              setState(() {});
                              return;
                            }

                            viewModel.doEvent(
                              AddUserEvent(),
                              UserCreated(
                                email: emailTextController.text,
                                firstName: firstNameTextController.text,
                                lastName: lastNameTextController.text,
                                password: passwordTextController.text,
                                phone: phoneTextController.text,
                                rePassword: confirmPasswordTextController.text,
                                username: userNameTextController.text,
                              ),
                            );
                          },
                          child: Text(SignupScreenTitles.signUp),
                        ),
                      );
                    },
                  ),

                  /// LOGIN TEXT
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(SignupScreenTitles.alreadyHaveAccount),
                      InkWell(
                        child: UnderlinedText(
                          underlinedText: SignupScreenTitles.login,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, LoginScreen.routeName);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
