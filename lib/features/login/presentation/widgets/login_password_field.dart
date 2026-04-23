import 'package:exam/core/app_strings/app_strings.dart';
import 'package:flutter/material.dart';

class LoginPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final String? errorText;
  final ValueChanged<String>? onChanged;

  const LoginPasswordField({
    super.key,
    required this.controller,
    this.errorText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: AppStrings.enterPassword,
        labelText: AppStrings.password,
        errorText: errorText,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppStrings.enterPassword;
        }
        return null;
      },
    );
  }
}
