import 'package:flutter/material.dart';
import 'package:shaikapp/screens/HomeScreen.dart';
import 'package:shaikapp/screens/SplashScreen.dart';
import 'package:shaikapp/screens/startScreen.dart';
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'HomeScreen':
        return _pageBuilder(page: HomeScreen(), settings: settings);
        break;
      case 'StartScreen':
        return _pageBuilder(page: StartScreen(), settings: settings);
        break;
      case 'SplashScreen':
        return _pageBuilder(page: SplashScreen(), settings: settings);
        break;
      default:
        throw Exception('INVALID ROUTE NAME ${settings.name}');
    }
  }

  static MaterialPageRoute _pageBuilder(
      {required Widget page, required RouteSettings settings}) {
    return MaterialPageRoute(builder: (_) => page, settings: settings);
  }
}
