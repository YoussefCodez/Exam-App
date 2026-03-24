import 'package:exam/config/di/di.dart';
import 'package:exam/features/reset_password/presentation/screens/new_password_screen.dart';
import 'package:exam/features/reset_password/presentation/screens/forgot_password_screen.dart';
import 'package:exam/features/reset_password/presentation/screens/verification_screen.dart';
import 'package:exam/features/sign_up/presentation/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'core/themes/app_theme.dart';

Future<void> main() async {
  configureDependencies();
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});
  final Map<String, WidgetBuilder> routes = {
    ResetScreen.routeName: (context) => const ResetScreen(),
    VerificationScreen.routeName: (context) => VerificationScreen(),
    NewPasswordScreen.routeName: (context) => NewPasswordScreen(),
      SignUpScreen.routeName: (context) => SignUpScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SignUpScreen.routeName,
      routes: routes,
      theme: AppTheme.lightTheme,
    );
  }
}
