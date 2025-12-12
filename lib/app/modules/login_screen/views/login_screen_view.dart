import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_screen_controller.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  const LoginScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 70),
              Center(
                child: ClipRRect(
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: 110,
                    width: 110,
                  ),
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
              Container(
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 10),
                      spreadRadius: 0.5,
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: Form(
                  child: Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 15, left: 3, right: 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Enter your mobile number',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          controller: controller.mobileController,
                          keyboardType: TextInputType.phone,
                          maxLength: 10, // Max length for 10-digit number
                          decoration: InputDecoration(
                            counterText: "", // Hide the default counter
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 16.0,
                              horizontal: 16.0,
                            ),
                            hintText: 'Enter mobile number',
                            hintStyle: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade500,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey.shade400),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color(0xff63C132),
                                width: 2,
                              ), // Focus border
                            ),
                            // Prefix (Country Code)
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 15, right: 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    '+91',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Container(
                                    height: 24,
                                    width: 2,
                                    color: Color(0xff9EE37D),
                                    margin: const EdgeInsets.only(left: 8),
                                  ),
                                ],
                              ),
                            ),
                            suffixIcon: Obx((){
                              if(controller.isPhoneValid.value){
                                return Padding(
                                  padding: EdgeInsetsGeometry.only(right: 10),
                                  child: Icon(Icons.check_circle_rounded,color: Color(0xff63C132),),
                                );
                              }
                              return const SizedBox.shrink();
                            })
                          ),
                        ),
                        SizedBox(height: 20,),
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: controller.requestOtp,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff358600),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              'Send OTP',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xffFFFFFF),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Outfit'
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Color(0x259EE37D),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Color(0xff63C132)),
                          ),
                          child: Text(
                            "We'll send a 4-digit OTP to your mobile number via SMS. Delivery time: 30-60 seconds.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff358600),
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Outfit',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 22,),
            ],
          ),
        ),
      ),
      bottomNavigationBar: TextButton(
        onPressed: () {
          // Navigate to Terms & Conditions screen
          print('Tapped on Terms & Conditions');
        },
        child: const Text(
          'Terms & Conditions Apply',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xff358600),
            fontWeight: FontWeight.w400,
            fontFamily: 'Outfit',
          ),
        ),
      ),
    );
  }
}
