import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  Future<void> saveUserData(
      int userId, String token, String phone, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('userId', userId);
    await prefs.setString('token', token);
    await prefs.setString('savedPhoneNumber', phone);
    await prefs.setString('savedPassword', password);
  }

  Future<Map<String, String?>> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'phone': prefs.getString('savedPhoneNumber'),
      'password': prefs.getString('savedPassword'),
    };
  }

  static const String _tokenKey = 'token';
  static const String _userIdKey = 'userId';
  static const String _userDataKey = 'userData';

  // /// Save user credentials and data
  // static Future<void> saveUserData({
  //   required String token,
  //   required int userId,
  //   required Map<String, dynamic> userData,
  // }) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString(_tokenKey, token);
  //   await prefs.setInt(_userIdKey, userId);
  //   await prefs.setString(_userDataKey, jsonEncode(userData));
  // }

  /// Get stored token
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  /// Get stored user ID
  static Future<int?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_userIdKey);
  }

  /// Get full user data map
  static Future<Map<String, dynamic>?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = prefs.getString(_userDataKey);
    if (jsonStr == null) return null;
    return jsonDecode(jsonStr);
  }

  /// Get specific user field like name
  static Future<String?> getUserName() async {
    final data = await getUserData();
    return data?['name'];
  }

  /// Clear all stored data
  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_userIdKey);
    await prefs.remove(_userDataKey);
  }
}

class SharedPrefsHelper {
  static Future<void> saveUserData(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('userData', jsonEncode(data));
  }

  static Future<Map<String, dynamic>?> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('userData');
    return userData != null ? jsonDecode(userData) : null;
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  static Future<int?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('userId');
  }
}
