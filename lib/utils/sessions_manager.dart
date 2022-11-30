import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionsManager{

 static const String userKey = "userKey";
static const String userId = "userId";

static void saveUserToken(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setString(userKey, data);
  }

  static void saveUserId(int data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setInt(userId, data);
  }

  static Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userId);
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