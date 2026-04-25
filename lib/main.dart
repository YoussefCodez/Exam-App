import 'package:exam/config/di/di.dart';
import 'package:exam/core/app_strings/app_strings.dart';
import 'package:exam/features/exam/presentation/screens/exam_screen.dart';
import 'package:exam/features/explore/presentation/screens/explore_screen.dart';
import 'package:exam/features/explore/presentation/screens/subject_screen.dart';
import 'package:exam/features/login/presentation/screens/login_screen.dart';
import 'package:exam/features/login/presentation/view_models/cubits/login_cubit.dart';
import 'package:exam/features/reset_password/presentation/screens/new_password_screen.dart';
import 'package:exam/features/reset_password/presentation/screens/forgot_password_screen.dart';
import 'package:exam/features/reset_password/presentation/screens/verification_screen.dart';
import 'package:exam/features/result/presentation/screens/main_result_screen.dart';
import 'package:exam/features/result/presentation/screens/result_screen.dart';
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
  final String? token = await storage.read(key: AppStrings.tokenKey);
  debugPrint(token);
  final bool rememberMe = prefs.getBool(AppStrings.rememberMeKey) ?? false;
  final String initialRoute = (token != null && rememberMe)
      ? AppStrings.examRoute
      : AppStrings.loginRoute;
  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  final String initialRoute;
  MyApp({super.key, required this.initialRoute});
  final Map<String, WidgetBuilder> routes = {
    LoginScreen.routeName: (context) => BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: const LoginScreen(),
    ),
    ForgotPasswordEmailPage.routeName: (context) => const ForgotPasswordEmailPage(),
    VerificationScreen.routeName: (context) => VerificationScreen(),
    NewPasswordScreen.routeName: (context) => NewPasswordScreen(),
    SignUpScreen.routeName: (context) => SignUpScreen(),
    ExploreScreen.routeName: (context) =>  ExploreScreen(),
    SubjectScreen.routeName: (context) => const SubjectScreen(),
    ExamScreen.routeName: (context) => ExamScreen(),
    ResultScreen.routeName: (context) => ResultScreen(),
    MainResultScreen.routeName: (context) => MainResultScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: ExploreScreen.routeName,
        routes: routes,
      ),
    );
  }
}
