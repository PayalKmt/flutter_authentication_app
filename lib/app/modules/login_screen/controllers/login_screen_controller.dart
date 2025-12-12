import 'package:authentication_app/app/services/app_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';

class LoginScreenController extends GetxController {
  //TODO: Implement LoginScreenController

  final AppService _appService = AppService();
  TextEditingController mobileController = TextEditingController();
  var isPhoneValid = false.obs;

  @override
  void onInit() {
    mobileController.addListener(_validatePhoneNumber);
    super.onInit();
  }

  void _validatePhoneNumber() {
    if (mobileController.text.length == 10 && AppConstants.indianMobileNumberRegex.hasMatch(mobileController.text)) {
      isPhoneValid.value = true;
    } else {
      isPhoneValid.value = false;
    }
  }

  Future<void> requestOtp() async {
    if (!isPhoneValid.value) {
      Get.snackbar('Validation Error', 'Please enter a valid 10-digit Indian mobile number.', snackPosition: SnackPosition.BOTTOM);
      return;
    }

    try {
      await _appService.loginAndSendOtp(phone: mobileController.text);
      Get.snackbar('Success', 'OTP sent to +91 ${mobileController.text}', snackPosition: SnackPosition.BOTTOM);
      Get.toNamed('/otp-screen', arguments: mobileController.text);
    } catch (e) {
      Get.snackbar('API Error', e.toString().replaceFirst('Exception: ', ''), snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    mobileController.dispose();
    super.onClose();
  }

}
