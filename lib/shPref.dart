import 'package:shared_preferences/shared_preferences.dart';
class SharedPreferencesHelper {

  static final String _Tocken = "tocken";
  static Future<String> getAuthTocken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_Tocken) ?? null;
  }

  static Future<bool> setAuthTocken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_Tocken, value);
  }

}