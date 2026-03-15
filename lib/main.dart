import 'package:exam/config/di/di.dart';
import 'package:exam/features/home/home_screen.dart';
import 'package:exam/features/login/presentation/screens/login_screen.dart';
import 'package:exam/features/login/presentation/view_models/cubits/login_cubit.dart';
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
  final String? token = await storage.read(key: 'token');
  final bool rememberMe = prefs.getBool('remember_me') ?? false;
  final String initialRoute = (token != null && rememberMe)
      ? '/home'
      : '/login';
  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  MyApp({super.key, required this.initialRoute});
  Map<String, WidgetBuilder> routes = {
    '/login': (context) => BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: const LoginScreen(),
    ),
    '/home': (context) => const HomeScreen(),
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
