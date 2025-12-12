import 'package:get/get.dart';

import '../../../services/auth_service.dart';

class SplashScreenController extends GetxController {
  //TODO: Implement SplashScreenController

  final AuthService _authService = AuthService();

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    await Future.delayed(const Duration(seconds: 2));
    String? token = await _authService.getAuthToken();
    if (token != null && token.isNotEmpty) {
      Get.offAllNamed('/home-screen');
    } else {
      Get.offAllNamed('/login-screen');
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
