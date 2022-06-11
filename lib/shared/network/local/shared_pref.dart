import 'package:shared_preferences/shared_preferences.dart';

class AppCacheSettings {
  static late SharedPreferences cacheObject;

  static Future<SharedPreferences> Cache_Intialisation() async {
    cacheObject = await SharedPreferences.getInstance();
    return cacheObject;
  }
}
