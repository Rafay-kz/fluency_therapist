import 'package:fluency_therapist/utils/utills.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:fluency_therapist/utils/app_colors.dart';

import '../../../controller/common_screens_controller/auth_screens_controller/email_verification_screen_controller.dart';
import '../../../custom widgets/button.dart';
import '../../../utils/app_constants.dart';

class EmailVerificationScreen
    extends GetView<EmailVerificationScreenController> {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width * 0.88;
    final double screenHeight = MediaQuery.of(context).size.height * 0.88;

    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image(
                      image: const AssetImage(otpVerificationImage),
                      width: screenWidth * 0.5,
                      height: screenHeight * 0.4,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.07),
                    child: Text(
                      "Email\nVerification",
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: screenWidth * 0.088),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.0020),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.07),
                    child: Text("Thank you for signing up!",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: screenWidth * 0.042,
                            )),
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.07),
                    child: Text(
                        "An email has been sent to your registered email address. Please verify your email to proceed and tap 'Done' to get started.",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: screenWidth * 0.042)),
                  ),
                  SizedBox(height: screenHeight * 0.06),
                  Button(
                    onPressed: () {
                      Get.offAllNamed(kLoginScreen);
                      Utils().toastMessage2(
                          "Make sure you verify your email and then log in");
                    },
                    text: "Done",
                  ),
                  SizedBox(height: screenHeight * 0.020),
                  Button(
                    onPressed: () {
                      controller.resendEmailVerification();
                    },
                    text: "Resend Email ",
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
