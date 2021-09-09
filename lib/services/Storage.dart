import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  // Future<String> getAuthToken() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getString('Authorization') ?? '';
  // }
  // Future<void> setAuthToken(String Authorizationtoken) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('Authorization',Authorizationtoken);
  // }

  Future<String> getCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('ClientProfile') ?? '';
  }

  Future<void> setCurrentUser(String userString) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('ClientProfile', userString);
  }

  Future<String> getCurrentLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('Localelanguage') ?? '';
  }

  Future<void> setCurrentLocale(String localstring) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('Localelanguage', localstring);
  }

  Future<void> removeCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('ClientProfile');
  }

}
