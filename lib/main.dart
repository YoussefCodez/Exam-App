import 'package:flutter/material.dart';

import 'core/themes/app_theme.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Map<String, WidgetBuilder> routes = {

  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      theme: AppTheme.lightTheme,
    );
  }
}
