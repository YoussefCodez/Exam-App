import 'package:exam/config/di/di.dart';
import 'package:exam/core/app_strings/app_strings.dart';
import 'package:exam/features/home/home_screen.dart';
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
  final String? token = await storage.read(key: AppStrings.tokenKey);
  final bool rememberMe = prefs.getBool(AppStrings.rememberMeKey) ?? false;
  final String initialRoute = (token != null && rememberMe)
      ? AppStrings.homeRoute
      : AppStrings.loginRoute;
  runApp(MyApp(initialRoute: initialRoute));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  final String initialRoute;
  MyApp({super.key, required this.initialRoute});
  final Map<String, WidgetBuilder> routes = {
    AppStrings.loginRoute: (context) => BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: const LoginScreen(),
    ),
    AppStrings.homeRoute: (context) => const HomeScreen(),
    ResetScreen.routeName: (context) => const ResetScreen(),
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
