import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../controllers/otp_screen_controller.dart';

class OtpScreenView extends GetView<OtpScreenController> {
  const OtpScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // --- 1. Title ---
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: PinCodeTextField(
                    appContext: context,
                    length: 4, // 6 digits as per design
                    animationType: AnimationType.fade,
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(8),
                      fieldHeight: 55, // Adjust height
                      fieldWidth: 45, // Adjust width
                      // The dark box color from the design (using a dark grey)
                      activeFillColor: Colors.grey.shade800,
                      inactiveFillColor: Colors.grey.shade800,
                      selectedFillColor: Color(
                        0xff63C132,
                      ), // Color when a box is selected
                      inactiveColor: Colors.transparent, // Hide the border
                      activeColor: Colors.transparent,
                      selectedColor: Color(0xff63C132),
                    ),
                    cursorColor: Colors.white, // Cursor color inside the dark box
                    animationDuration: const Duration(milliseconds: 200),
                    backgroundColor: Colors.transparent,
                    enableActiveFill: true,
                    onChanged: controller.onOtpChange,
                    // Ensure text style is white to be visible in the dark boxes
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Outfit',
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Obx(() {
                  if (controller.resendTimer.value > 0) {
                    return Center(
                      child: Text(
                        'Resend OTP in ${controller.resendTimer.value} seconds',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey.shade600,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }
                  return SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: controller.resendOtp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff358600), // Main Green
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Resend OTP',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600, // Semibold
                          fontFamily: 'Outfit',
                        ),
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: controller.verifyOtp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff358600), // Main Green
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Submit OTP',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600, // Semibold
                        fontFamily: 'Outfit',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
