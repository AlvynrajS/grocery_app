import 'package:shared_preferences/shared_preferences.dart';

class Singleton {
  static late SharedPreferences _prefsInstance;

  // static Future<SharedPreferences> get instance async =>
  //     _prefsInstance ??=

  static Future<SharedPreferences> init() async {
    _prefsInstance = await SharedPreferences.getInstance();
    return _prefsInstance;
  }

  static String getString(String key, [String? defValue]) {
    return _prefsInstance.getString(key) ?? defValue ?? "";
  }

  static Future<bool> setString(String key, String value) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  static String getInitials(String text) {
    List<String> names = text.split("");
    String initials = "";
    for (var i = 0; i < names.length; i++) {
      initials = names[0];
    }
    return initials;
  }
}
