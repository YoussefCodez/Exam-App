import 'package:email_validator/email_validator.dart';
import 'package:exam/config/di/di.dart';
import 'package:exam/core/app_strings/app_strings.dart';
import 'package:exam/core/colors/app_colors.dart';
import 'package:exam/core/values/profile/profile_titles.dart';
import 'package:exam/features/change_password/presentation/screens/change_password_screen.dart';
import 'package:exam/features/profile/presentation/view_model/cubit/cubit.dart';
import 'package:exam/features/profile/presentation/view_model/states/profile_events.dart';
import 'package:exam/features/profile/presentation/view_model/states/profile_states.dart';
import 'package:exam/features/reset_password/presentation/screens/new_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:password_validator_mate/password_validator_mate.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = ProfileTitles.routeName;
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final userNameTextController = TextEditingController();
  final firstNameTextController = TextEditingController();
  final lastNameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final phoneTextController = TextEditingController();

  final ProfileViewModel viewModel = getIt.get<ProfileViewModel>();

  @override
  void initState() {
    super.initState();
    getToken();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getToken() async {
    final storage = getIt<FlutterSecureStorage>();
    final token = await storage.read(key: AppStrings.tokenKey);

    viewModel.doEvent(GetUserProfileInfoEvent(), token ?? '', null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(ProfileTitles.title)),
      body: Form(
        key: _formKey,
        child: BlocProvider(
          create: (context) => viewModel,
          child: BlocBuilder<ProfileViewModel, ProfileStates>(
            builder: (context, state) {
              if (state is ProfileLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.blue),
                );
              }

              if (state is ProfileError) {
                return SnackBar(content: Text(state.message));
              }

              if (state is ProfileSuccess) {
                userNameTextController.text = state.user.username!;
                firstNameTextController.text = state.user.firstName!;
                lastNameTextController.text = state.user.lastName!;
                emailTextController.text = state.user.email!;
                phoneTextController.text = state.user.phone!;
                passwordTextController.text = ProfileTitles.password;
                return Column(
                  children: [
                    /// USERNAME
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: ProfileTitles.username,
                        ),
                        controller: userNameTextController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return ProfileTitles.usernameRequired;
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
                                labelText: ProfileTitles.firstName,
                              ),
                              controller: firstNameTextController,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return ProfileTitles.firstNameRequired;
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
                                labelText: ProfileTitles.lastName,
                              ),
                              controller: lastNameTextController,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return ProfileTitles.lastNameRequired;
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
                          labelText: ProfileTitles.email,
                        ),
                        controller: emailTextController,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return ProfileTitles.emailRequired;
                          }
                          if (!EmailValidator.validate(value)) {
                            return ProfileTitles.emailInvalid;
                          }
                          return null;
                        },
                      ),
                    ),

                    /// PASSWORD
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: ProfileTitles.password,
                          border: OutlineInputBorder(),
                          suffixIcon: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                ChangePasswordScreen.routeName,
                                arguments: '',
                              );
                            },
                            child: Text(
                              ProfileTitles.change,
                              style: const TextStyle(
                                color: AppColors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        controller: passwordTextController,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return ProfileTitles.passwordRequired;
                          }

                          return null;
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
                          labelText: ProfileTitles.phone,
                        ),
                        controller: phoneTextController,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return ProfileTitles.phoneRequired;
                          }
                          if (value.length < 11) {
                            return ProfileTitles.phoneInvalid;
                          }
                          return null;
                        },
                      ),
                    ),

                    /// UPDATE BUTTON
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                if (!_formKey.currentState!.validate()) {
                                  setState(() {});
                                  return;
                                }

                                // viewModel.doEvent(
                                //   UpdateUserEvent(),
                                //   UserCreated(
                                //     email: emailTextController.text,
                                //     firstName: firstNameTextController.text,
                                //     lastName: lastNameTextController.text,
                                //     password: passwordTextController.text,
                                //     phone: phoneTextController.text,
                                //     rePassword:
                                //         confirmPasswordTextController.text,
                                //     username: userNameTextController.text,
                                //   ),
                                // );
                              },
                              child: Text(ProfileTitles.update),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }

              return SnackBar(
                content: Text(
                  ProfileTitles.loadingProfile,
                  style: TextStyle(color: AppColors.red),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
