import 'package:shared_preferences/shared_preferences.dart';

class Global {
  // 是否为release版
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  static SharedPreferences _prefs;

  static String userName;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
    userName = _prefs.getString('user_name');
  }

  static void setUserName(String userName) async {
    Global.userName = userName;
    await _prefs.setString('user_name', userName);
  }
}
