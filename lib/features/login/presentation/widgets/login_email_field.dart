import 'package:exam/core/app_strings/app_strings.dart';
import 'package:flutter/material.dart';

class LoginEmailField extends StatelessWidget {
  final TextEditingController controller;
  final String? errorText;
  final ValueChanged<String>? onChanged;

  const LoginEmailField({
    super.key,
    required this.controller,
    this.errorText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: AppStrings.enterEmail,
        labelText: AppStrings.email,
        errorText: errorText,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppStrings.enterEmail;
        }
        return null;
      },
    );
  }
}
