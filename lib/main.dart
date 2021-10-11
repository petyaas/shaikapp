import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shaikapp/router.dart';
import 'package:shaikapp/style.dart';
import 'package:get/get.dart';
import 'package:shaikapp/translations/Translations.dart';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
final navigatorKey = GlobalKey<NavigatorState>();
 main() async{

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) =>
          MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      themeMode: ThemeMode.light,
   translations: AppTranslations(),
    initialRoute: 'SplashScreen',
    theme: AppColor.getThemeData(),
    onGenerateRoute: AppRouter.generateRoute,
    );

  }
}

