import 'dart:async';
import 'package:get/get.dart';
import '../../../services/app_service.dart';
import '../../../services/auth_service.dart';

class OtpScreenController extends GetxController {
  //TODO: Implement OtpScreenController

  final AppService _appService = AppService();
  final AuthService _authService = AuthService();
  final phone = Get.arguments as String;
  var otpInput = ''.obs;
  var resendTimer = 30.obs;
  Timer? _timer;

  void onOtpChange(String value) {
    otpInput.value = value;
  }

  Future<void> verifyOtp() async {
    if (otpInput.value.length != 4) {
      Get.snackbar('Validation Error', 'Please enter the 4-digit OTP.', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    try {
      final tokenModel = await _appService.verifyOtp(phone: phone, otp: otpInput.value);
      await _authService.saveAuthData(token: tokenModel.token, phone: phone);
      Get.toNamed('/home-screen');
    } catch (e) {
      Get.snackbar('Verification Failed', e.toString().replaceFirst('Exception: ', ''), snackPosition: SnackPosition.BOTTOM);
    }
  }

  void startResendTimer() {
    resendTimer.value = 30; // Reset timer to 30 seconds
    _timer?.cancel(); // Cancel any existing timer

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendTimer.value > 0) {
        resendTimer.value--;
      } else {
        _timer?.cancel();
      }
    });
  }

  Future<void> resendOtp() async {
    if (resendTimer.value > 0) return;
    try {
      await _appService.loginAndSendOtp(phone: phone);
      Get.snackbar('Success', 'New OTP sent to $phone', snackPosition: SnackPosition.BOTTOM);
      startResendTimer();
    } catch (e) {
      Get.snackbar('API Error', e.toString().replaceFirst('Exception: ', ''), snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  void onInit() {
    startResendTimer();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
