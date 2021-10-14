import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shaikapp/getX/ProfileX.dart';
import 'package:shaikapp/getX/sliderX.dart';
import 'package:shaikapp/router.dart';
import 'package:shaikapp/services/firebase_messaging_service.dart';
import 'package:shaikapp/style.dart';
import 'package:get/get.dart';
import 'package:shaikapp/translations/Translations.dart';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
final navigatorKey = GlobalKey<NavigatorState>();
 initServices() async {
  Get.log('starting services ...');
  // await GetStorage.init();
  await Get.putAsync(() => SliderGetX().init());
  await Get.putAsync(() => ProfileX().init());
  // await Get.putAsync(() => GlobalService().init());
  await Firebase.initializeApp();
  // await Get.putAsync(() => AuthService().init());
  await Get.putAsync(() => FireBaseMessagingService().init());
  // await Get.putAsync(() => LaravelApiClient().init());
  // await Get.putAsync(() => FirebaseProvider().init());
  // await Get.putAsync(() => SettingsService().init());
  Get.log('All services started...');
}
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await initServices();

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
      title: 'shaik',
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

