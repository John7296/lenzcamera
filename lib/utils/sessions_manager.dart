import 'package:shared_preferences/shared_preferences.dart';

class SessionsManager{

 static const String userKey = "userKey";
 

static void saveUserToken(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setString(userKey, data);
  }

static Future<String?> getUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userKey);
  }

   static Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(userKey);
  }

}