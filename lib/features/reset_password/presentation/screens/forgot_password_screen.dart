import 'package:email_validator/email_validator.dart';
import 'package:exam/core/themes/app_colors.dart';
import 'package:exam/features/reset_password/presentation/screens/verification_screen.dart';
import 'package:exam/features/reset_password/presentation/view_model/cubit/reset_view_model.dart';
import 'package:exam/features/reset_password/presentation/view_model/states/reset_events.dart';
import 'package:exam/features/reset_password/presentation/view_model/states/reset_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/di/di.dart';
import 'package:flutter/material.dart';

class ResetScreen extends StatefulWidget {
  static const String routeName = '/reset';
  const ResetScreen({super.key});

  @override
  State<ResetScreen> createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
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
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pushNamed(
                  context,
                  VerificationScreen.routeName,
                  arguments: emailTextController.text.trim(),
                );
              });
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
                  const SizedBox(height: 20),

                  Text(
                    'Forget password',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Please enter your email associated to\n your account',
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
                        labelText: "Email",
                        hintText: "Enter your email",
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Email is required';
                        }
                        if (!EmailValidator.validate(value.trim())) {
                          return 'The Email is not valid';
                        }
                        return null;
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// BUTTON
                  Padding(
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
                        child: const Text("Continue"),
                      ),
                    ),
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
