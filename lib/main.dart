import 'package:flutter/material.dart';
import 'package:shaikapp/router.dart';
import 'package:shaikapp/style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
//      translations: BBtranslationns(),
      initialRoute: 'SplashScreen',
      theme: AppColor.getThemeData(),
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}

