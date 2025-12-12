class AppConstants {
  static const String baseUrl = 'https://sms-backend-kjcb.onrender.com';
  static const String accessTokenKey = 'access_token';
  static const String phoneKey = 'user_phone';

  // Regex for 10-digit Indian mobile number validation
  static final RegExp indianMobileNumberRegex = RegExp(r'^[6-9]\d{9}$');
}