import 'package:fluency_therapist/utils/app_colors.dart';
import 'package:fluency_therapist/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/common_screens_controller/auth_screens_controller/welcome_screen_controller.dart';
import '../../../custom widgets/button.dart';


//created by Abdul Rafay on 1-5-2023
class WelcomeScreen extends GetView<WelcomeScreenController> {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(right: 25, left: 25, top: 20, bottom: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image(
                    image: const AssetImage(splashScreenImage),
                    width: screenWidth * 0.8,
                    height: screenHeight * 0.40,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Image(
                    image: const AssetImage(fluencyTherapistLogo),
                    height: screenHeight * 0.12,
                    width: screenWidth * 0.42,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 10),
                  child: Text("Empowering communication \nthrough fluency",
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontSize: screenWidth * 0.050,
                          )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 10),
                  child: Text(
                    "Personalized exercises, progress tracking \nand expert consultation for improved \ncommunication and quality of life.",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: AppColors.textColor.withOpacity(0.3),
                        fontWeight: FontWeight.w400,
                        fontSize: screenWidth * 0.0393),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 13),
                    child: Button(
                        onPressed: () {
                          Get.toNamed(kLoginScreen);
                        },
                        text: "Login")),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Button(
                    onPressed: () {
                      Get.toNamed(kSignUpScreen);
                    },
                    text: "Register",
                    textStyle: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 20,
                    ),
                    color: AppColors.backgroundColor,
                    side: BorderSide(width: 1.5, color: AppColors.textColor),
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