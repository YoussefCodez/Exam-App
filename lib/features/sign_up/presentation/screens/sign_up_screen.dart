import 'package:exam/features/sign_up/presentation/widgets/underlined_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/themes/app_colors.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = 'SignUpScreen';

  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsetsGeometry.all(16.0),
          child: Icon(Icons.arrow_back_ios),
        ),
        title: Text('Sign Up'),
        titleSpacing: 0,
      ),
      body: Column(
        children: [
          // username
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Username",
                hintText: "Enter your username",
              ),
            ),
          ),

          // first and last names
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "First name",
                      hintText: "Enter first name",
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Last name",
                      hintText: "Enter Last name",
                    ),
                  ),
                ),
              ),
            ],
          ),

          // email
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Enter your email",
              ),
            ),
          ),

          // password and confirm password
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter password",
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Confirm password",
                      hintText: "Confirm password",
                    ),
                  ),
                ),
              ),
            ],
          ),

          // phone number
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Phone number",
                hintText: "Enter your phone number",
              ),
            ),
          ),

          // Signup button
          Row(
            children: [
              Expanded(child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(onPressed: (){}, child: Text("Signup")),
              )),
            ],
          ),

          // Already have an account
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an account? "),
              UnderlinedText(underlinedText: "Login"),
            ],
          )
        ],
        
      ),
    );
  }
}
