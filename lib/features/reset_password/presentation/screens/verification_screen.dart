import 'package:exam/config/di/di.dart';
import 'package:exam/core/values/forgot_password_titles.dart';
import 'package:exam/core/values/routes.dart';
import 'package:exam/core/themes/app_colors.dart';
import 'package:exam/features/reset_password/presentation/screens/new_password_screen.dart';
import 'package:exam/features/reset_password/presentation/view_model/cubit/reset_view_model.dart';
import 'package:exam/features/reset_password/presentation/view_model/states/reset_events.dart';
import 'package:exam/features/reset_password/presentation/view_model/states/reset_states.dart';
import 'package:exam/features/reset_password/presentation/widgets/underlined_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationScreen extends StatelessWidget {
  static const String routeName = Routes.verificationScreen;

  VerificationScreen({super.key});

  final ResetViewModel viewModel = getIt.get<ResetViewModel>();

  @override
  Widget build(BuildContext context) {
    final String email = ModalRoute.of(context)!.settings.arguments as String;
    List<String> pinCode = [
      ForgotPasswordTitles.empty,
      ForgotPasswordTitles.empty,
      ForgotPasswordTitles.empty,
      ForgotPasswordTitles.empty,
      ForgotPasswordTitles.empty,
      ForgotPasswordTitles.empty,
    ];
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocListener<ResetViewModel, ResetStates>(
        listener: (context, state) {
          if (state is ResetLoading) {
            Center(child: CircularProgressIndicator(color: AppColors.blue));
          } else if (state is ResetSuccess) {
            Navigator.pushReplacementNamed(
              context,
              NewPasswordScreen.routeName,
              arguments: email,
            );
          } else if (state is ResetError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: Scaffold(
          appBar: AppBar(title: const Text(ForgotPasswordTitles.password)),
          body: BlocBuilder<ResetViewModel, ResetStates>(
            builder: (context, state) {
              if (state is ResetLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is ResetSuccess) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.pushReplacementNamed(
                    context,
                    NewPasswordScreen.routeName,
                    arguments: email,
                  );
                });
              }

              if (state is ResetError) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  pinCode = [
                    ForgotPasswordTitles.empty,
                    ForgotPasswordTitles.empty,
                    ForgotPasswordTitles.empty,
                    ForgotPasswordTitles.empty,
                    ForgotPasswordTitles.empty,
                    ForgotPasswordTitles.empty,
                  ];
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                });
              }

              return Column(
                children: [
                  Text(
                    ForgotPasswordTitles.emailVerifier,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      ForgotPasswordTitles.enterCodeFromEmail,
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  ),

                  SizedBox(
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width * (1 / 6),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge!
                                .copyWith(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                            maxLength: 1,
                            decoration: const InputDecoration(
                              counterText: ForgotPasswordTitles.empty,
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              pinCode[index] = value;
                              // Check if all fields are filled
                              if (pinCode.every((e) => e.isNotEmpty)) {
                                final code = pinCode.join();

                                viewModel.doEvent(
                                  event: VerifyResetCodeEvent(),
                                  code: code,
                                );
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 50),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(ForgotPasswordTitles.noCodeReceived),
                      InkWell(
                        onTap: () {
                          viewModel.doEvent(
                            event: ForgotPasswordEvent(),
                            email: email,
                          );
                        },

                        child: UnderlinedText(
                          underlinedText: ForgotPasswordTitles.resendCode,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
