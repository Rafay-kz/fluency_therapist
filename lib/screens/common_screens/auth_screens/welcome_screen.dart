import 'package:fluency_therapist/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/common_screens_controller/auth_screens_controller/welcome_screen_controller.dart';
import '../../../custom widgets/button.dart';
import '../../../utils/app_constants.dart';

class WelcomeScreen extends GetView<WelcomeScreenController> {
  const WelcomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width * 0.88;
    final double screenHeight = MediaQuery.of(context).size.height * 0.88;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image(
                      image: const AssetImage(splashScreenImage),
                      width: screenWidth * 0.99,
                      height: screenHeight * 0.48,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.07),
                    child: Image(
                      image: const AssetImage(fluencyTherapistLogo),
                      width: screenWidth * 0.38,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.07),
                    child: Text(
                      "Empowering communication \nthrough fluency",
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontSize: screenWidth * 0.053,
                          ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.07),
                    child: Text(
                      "Personalized exercises, progress tracking \nand expert consultation for improved \ncommunication and quality of life.",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: AppColors.textColor.withOpacity(0.3),
                        fontWeight: FontWeight.w400,
                        fontSize: screenWidth * 0.0393,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Center(
                    child: Button(
                      onPressed: () {
                        Get.toNamed(kLoginScreen);
                      },
                      text: "Login",
                      textStyle: null,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.020),
                  Center(
                    child: Button(
                      onPressed: () {
                        Get.toNamed(kSignUpScreen);
                      },
                      text: "Register",
                      textStyle: TextStyle(
                        color: AppColors.textColor,
                        fontFamily: "Montserrat",
                        fontSize: screenWidth * 0.043,
                        fontWeight: FontWeight.w600,
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
      ),
    );
  }
}
