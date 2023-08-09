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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Image(
                      image: const AssetImage(otpVerificationImage),
                      width: screenWidth * 0.5,
                      height: screenHeight * 0.4,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top:5),
                  child: Text(
                    "Email\nVerification",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 25),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 10),
                  child: Text("Thank you for signing up!",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 14)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 10),
                  child: Text(
                      "An email has been sent to your registered email address verify your email and then log in to get started.",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 14)),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Button(
                      onPressed: () {
                      Get.offAllNamed(kLoginScreen);
                      Utils().toastMessage2("Make sure you verify your email and then log in");
                      },
                      text: "Sign In",
                    )),Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Button(
                      onPressed: () {
                        controller.resendEmailVerification();
                      },
                      text: "Resend Email ",
                    ))
              ],
            ),
          ),
        ));
  }
}
