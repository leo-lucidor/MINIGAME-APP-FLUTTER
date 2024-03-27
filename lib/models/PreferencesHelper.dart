import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  static Future<int> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('id') ?? 0;
  }

  static Future<void> setUserId(int idUser) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('id', idUser);
  }
}