import 'package:shared_preferences/shared_preferences.dart';

class SessionsManager{

 static const String userToken = "userToken";

static void saveUserToken(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userToken, data);
  }

static Future<String?> getUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userToken);
  }

   static Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(userToken);
  }

}