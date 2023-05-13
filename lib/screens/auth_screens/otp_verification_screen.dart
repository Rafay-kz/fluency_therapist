import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth_screens_controller/otp_verification_screen_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/widgets/button.dart';
import 'create_new_password_screen.dart';

class OtpVerificationScreen extends GetView<OtpVerificationScreenController> {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Image(
                      image: const AssetImage(otpVerificationImage),
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.4,
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(right: 110, top: 15),
                    child: Text(
                      "Otp\nVerification",
                      style: Theme.of(context).textTheme.displayLarge,
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 8, right: 70, bottom: 10),
                  child: Text(
                      "A 4 digit code has been sent to \n+93 3313136702",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 14)),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: SizedBox(
                      width: 400,
                      child: TextFormField(
                        // cursorColor: Colors.black,
                        controller: controller.otpTEController,
                        decoration: InputDecoration(
                            fillColor: AppColors.textfieldColor,
                            filled: true,
                            hintText: 'Enter the verification code',
                            hintStyle: Theme.of(context).textTheme.titleMedium,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none),
                            prefixIcon: Icon(
                              Icons.stars,
                              color: AppColors.textHintColor,
                            )),
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Button(
                      onPressed: () {
                        Get.to(const CreateNewPasswordScreen());
                      },
                      text: "Verify",
                    ))
              ],
            ),
          ),
        ));
  }
}
