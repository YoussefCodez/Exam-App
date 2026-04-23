import 'package:exam/config/di/di.dart';
<<<<<<< HEAD
import 'package:exam/core/values/log_in/login_user_titles.dart';
=======
import 'package:exam/core/app_strings/app_strings.dart';
import 'package:exam/features/exam/presentation/screens/exam_screen.dart';
import 'package:exam/features/home/home_screen.dart';
>>>>>>> 1cd2b61240cec86a61c3c1e360e115333a02c5ed
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
import 'package:exam/config/hive/hive_setup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/themes/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveSetup.init();
  await configureDependencies();
  final storage = getIt<FlutterSecureStorage>();
  final prefs = getIt<SharedPreferences>();
<<<<<<< HEAD
  final String? token = await storage.read(key: LoginUserTitles.tokenKey);
  final bool rememberMe = prefs.getBool(LoginUserTitles.rememberMeKey) ?? false;
  final String initialRoute = (token != null && rememberMe)
      ? LoginUserTitles.homeRoute
      : LoginUserTitles.loginRoute;
=======
  final String? token = await storage.read(key: AppStrings.tokenKey);
  debugPrint(token);
  final bool rememberMe = prefs.getBool(AppStrings.rememberMeKey) ?? false;
  final String initialRoute = (token != null && rememberMe)
      ? AppStrings.examRoute
      : AppStrings.loginRoute;
>>>>>>> 1cd2b61240cec86a61c3c1e360e115333a02c5ed
  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
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
    ExamScreen.routeName: (context) => ExamScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: initialRoute,
        routes: routes,
      ),
    );
  }
}
