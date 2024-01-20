
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/doctor_screens_controller/doctor_verification_screen_controller.dart';
import '../../utils/app_colors.dart';
import '../../custom widgets/button.dart';
import '../../utils/app_constants.dart';

class DoctorVerificationScreen extends GetView<DoctorVerificationScreenController> {
  DoctorVerificationScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width*0.88;
    final double screenHeight = MediaQuery.of(context).size.height * 0.88;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.05),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: screenWidth * 0.020),
                  child: Center(
                    child: Image(
                      image: const AssetImage(fluencyTherapistLogo),
                      width: screenWidth * 0.38,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.025),
                Center(
                  child: Text(
                    'Verification in Process...',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontSize: screenWidth * 0.045),
                  ),
                ),
                SizedBox(height: screenHeight * 0.045),

                Obx(() {
                  return Text(controller.verificationMessage.value,
                    style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: screenWidth * 0.038),
                    textAlign: TextAlign.start,
                  );
                }),
                SizedBox(height: screenHeight * 0.025),
                Button(onPressed: () {
                  controller.logout();
                }, text: 'Logout'),
            ],),
          ),

        ),
      ),
    );
  }
}
