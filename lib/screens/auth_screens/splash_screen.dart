import 'package:fluency_therapist/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../controller/auth_screens_controller/splash_screen_controller.dart';
import '../../utils/app_constants.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    controller.navigate();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image(
              image: const AssetImage(fluencyTherapistLogo),
              height: screenHeight * 0.12,
              width: screenWidth * 0.42,
            ),
          ),
      ],),
    ),);
  }
}
