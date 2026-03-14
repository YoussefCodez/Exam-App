import 'package:exam/core/themes/app_colors.dart';
import 'package:exam/features/sign_up/domain/entities/user_created.dart';
import 'package:exam/features/sign_up/presentation/view_model/cubit/signup_view_model.dart';
import 'package:exam/features/sign_up/presentation/view_model/states/signup_states.dart';
import 'package:exam/features/sign_up/presentation/widgets/underlined_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/di/di.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = 'SignUpScreen';

  final _formKey = GlobalKey<FormState>();

  final userNameTextController = TextEditingController();
  final firstNameTextController = TextEditingController();
  final lastNameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();
  final phoneTextController = TextEditingController();

  SignUpScreen({super.key});

  final SignupViewModel viewModel = getIt.get<SignupViewModel>();

  @override
  Widget build(BuildContext context) {
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
                  title: const Text("Success"),
                  content: Text(
                    "Welcome, ${state.user.firstName}",
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // close dialog
                        Navigator.pop(context); // go back
                      },
                      child: const Text("OK"),
                    )
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
                  title: const Text("Error"),
                  content: Text(state.message),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("OK"),
                    )
                  ],
                );
              },
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            leading: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(Icons.arrow_back_ios),
            ),
            title: const Text('Sign Up'),
            titleSpacing: 0,
          ),
          body: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),

                /// USERNAME
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Username",
                      hintText: "Enter your username",
                    ),
                    controller: userNameTextController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Username is required';
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
                            horizontal: 16, vertical: 8),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: "First name",
                            hintText: "Enter first name",
                          ),
                          controller: firstNameTextController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'First name is required';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Last name",
                            hintText: "Enter last name",
                          ),
                          controller: lastNameTextController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Last name is required';
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Email",
                      hintText: "Enter your email",
                    ),
                    controller: emailTextController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Email is required';
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
                            horizontal: 16, vertical: 8),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Password",
                            hintText: "Enter password",
                          ),
                          controller: passwordTextController,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Password is required';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Confirm password",
                            hintText: "Confirm password",
                          ),
                          controller: confirmPasswordTextController,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Confirm password is required';
                            }
                            if (value != passwordTextController.text) {
                              return 'Passwords must match';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),

                /// PHONE
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Phone number",
                      hintText: "Enter your phone number",
                    ),
                    controller: phoneTextController,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Phone number is required';
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
                        child:
                            CircularProgressIndicator(color: AppColors.blue),
                      );
                    }

                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) return;

                          viewModel.addUser(
                            user: UserCreated(
                              email: emailTextController.text,
                              firstName: firstNameTextController.text,
                              lastName: lastNameTextController.text,
                              password: passwordTextController.text,
                              phone: phoneTextController.text,
                              rePassword:
                                  confirmPasswordTextController.text,
                              username: userNameTextController.text,
                            ),
                          );
                        },
                        child: const Text("Signup"),
                      ),
                    );
                  },
                ),

                /// LOGIN TEXT
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Already have an account? "),
                    UnderlinedText(underlinedText: "Login"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}