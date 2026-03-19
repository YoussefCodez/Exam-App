import 'package:exam/config/di/di.dart';
import 'package:exam/features/reset_password/presentation/screens/new_password_screen.dart';
import 'package:exam/features/reset_password/presentation/screens/forgot_password_screen.dart';
import 'package:exam/features/reset_password/presentation/screens/verification_screen.dart';
import 'package:flutter/material.dart';

import 'core/themes/app_theme.dart';

Future<void> main() async {
  configureDependencies();
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  Map<String, WidgetBuilder> routes = {
    ResetScreen.routeName: (context) => const ResetScreen(),
    VerificationScreen.routeName: (context) => VerificationScreen(),
    NewPasswordScreen.routeName: (context) => NewPasswordScreen(),
  };

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: ResetScreen.routeName,
      theme: AppTheme.lightTheme,
    );
  }
}
