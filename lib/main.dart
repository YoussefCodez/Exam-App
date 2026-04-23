import 'package:exam/config/di/di.dart';
import 'package:exam/core/values/log_in/login_user_titles.dart';
import 'package:exam/features/login/presentation/screens/login_screen.dart';
import 'package:exam/features/login/presentation/view_models/cubits/login_cubit.dart';
import 'package:exam/features/reset_password/presentation/screens/new_password_screen.dart';
import 'package:exam/features/reset_password/presentation/screens/forgot_password_screen.dart';
import 'package:exam/features/reset_password/presentation/screens/verification_screen.dart';
import 'package:exam/features/sign_up/presentation/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/themes/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  final storage = getIt<FlutterSecureStorage>();
  final prefs = getIt<SharedPreferences>();
  final String? token = await storage.read(key: LoginUserTitles.tokenKey);
  final bool rememberMe = prefs.getBool(LoginUserTitles.rememberMeKey) ?? false;
  final String initialRoute = (token != null && rememberMe)
      ? LoginUserTitles.homeRoute
      : LoginUserTitles.loginRoute;
  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  MyApp({super.key, required this.initialRoute});
  final Map<String, WidgetBuilder> routes = {
    LoginUserTitles.loginRoute: (context) => BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: const LoginScreen(),
    ),
    ForgotPasswordEmailPage.routeName: (context) => const ForgotPasswordEmailPage(),
    VerificationScreen.routeName: (context) => VerificationScreen(),
    NewPasswordScreen.routeName: (context) => NewPasswordScreen(),
    SignUpScreen.routeName: (context) => SignUpScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: initialRoute,
        routes: routes,
      ),
    );
  }
}
