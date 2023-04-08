import 'package:shared_preferences/shared_preferences.dart';

class PrefServices {
  static late SharedPreferences _pref;

  static Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

  static Future<void> addData(String vel, String key) async {
    await _pref.setString(key, vel);
  }

  static String getString(String key) {
    return _pref.getString(key) ?? "";
  }

  static Future<void> prefClear() async {
    await _pref.clear();
  }
}
