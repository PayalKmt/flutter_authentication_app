import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants.dart';

class AuthService {



  // Save JWT token and phone number to SharedPreferences
  Future<void> saveAuthData({required String token, required String phone}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstants.accessTokenKey, token);
    await prefs.setString(AppConstants.phoneKey, phone);
  }

  // Retrieve JWT token
  Future<String?> getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppConstants.accessTokenKey);
  }

  // Retrieve Phone Number
  Future<String?> getPhoneNumber() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppConstants.phoneKey);
  }

  // Clear all authentication data on logout
  Future<void> clearAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(AppConstants.accessTokenKey);
    await prefs.remove(AppConstants.phoneKey);
  }

  // Check if a user is currently logged in
  Future<bool> isAuthenticated() async {
    final token = await getAuthToken();
    return token != null && token.isNotEmpty;
  }
}