import 'package:exam/features/sign_up/presentation/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'config/di/di.dart';
import 'core/themes/app_theme.dart';

Future<void> main() async {
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final Map<String, WidgetBuilder> routes = {
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
