import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionsManager {
  static const String userKey = "userKey";
  static const String userId = "userId";
  static const String place = "place";
  static const String pincodeId = "pincodeId";
  static const String guestId = "guestId";

  static Future<String?> getUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userKey);
  }

  static void saveUserToken(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userKey, data);
  }

    static Future< String? > getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userId);
  }

  static void saveUserId(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userId, data);
  }



  static Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(userKey);
  }

  static void clearSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
    static Future<String?> getPlace() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(place);
  }

  static void saveUserPlace(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(place, data);
  }

    static void savePincode(int data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(pincodeId, data);
  }

  static Future<int?> getPincode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(pincodeId);
  }

    static void saveGuestId(int data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(guestId, data);
  }

  static Future<int?> getGuestId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(guestId);
  }

}
