import 'package:shared_preferences/shared_preferences.dart';
class Storage {
  static Future<void> saveToken(String token) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('access_token', token);
  }

  static Future<String?> getToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString('access_token');
  }

  static Future<void> removeToken() async {
    final pref = await SharedPreferences.getInstance();
    pref.remove('access_token');
  }
}