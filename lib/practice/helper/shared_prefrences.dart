import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  /// =================== SAVE DATA TO SHARED PREFERENCES
  static Future setString(String key, value) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString(key, value);
  }

  /// ============ GET SHARED PREFERENCES VALUES=================

 static Future<String> getString(String key)async{
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getString(key)??'';
 }

}
