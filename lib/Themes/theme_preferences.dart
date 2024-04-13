import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences{
  static saveTheme({required bool isDark}) async{
    final prefs =await SharedPreferences.getInstance();
  //   getInstance return a future type instance
  //   (object) so we have to use await and async
    prefs.setBool('isDark', isDark);
  }
  static Future<bool> getTheme() async {
    final prefs =await SharedPreferences.getInstance();
    return prefs.getBool('isDark') ?? false;
  //   return false by default if the user hasn't
  //   yet set a value for the isDark value (Theme)
  }
}