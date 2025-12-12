import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashScreenController());
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ClipRRect(
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: 110,
                    width: 110,
                  ),
                ),
                SizedBox(height: 28),
                Text(
                  "SchoolSync ERP",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w500,
                    color: Color(0xff63C132),
                  ),
                ),
              ],
            ),
          ),
        ))
    );
  }
}
