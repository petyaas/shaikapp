import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shaikapp/router.dart';
import 'package:shaikapp/style.dart';
import 'package:get/get.dart';
import 'package:shaikapp/translations/Translations.dart';

import 'package:device_preview/device_preview.dart';

void main() {
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  );

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
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

