import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_screen_controller.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  const HomeScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Wellcome to",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w500,
                  color: Color(0xff63C132),
                ),
              ),
              SizedBox(height: 22),
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
              SizedBox(height: 22),
              Text(
                "Where Technology Meets Academic Excellence.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w500,
                  color: Color(0xff358600),
                ),
              ),
              SizedBox(height: 22),
              Obx(()=> Text(
                  "User's Phone Number - ${controller.phone.value}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w500,
                    // color: Color(0xff358600),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: controller.logout,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff358600), // Main Green
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Log Out',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600, // Semibold
                        fontFamily: 'Outfit',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ))
    );
  }
}
