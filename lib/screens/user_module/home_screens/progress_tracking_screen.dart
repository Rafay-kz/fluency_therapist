import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../controller/user_screens_controller/home_screens_controller/progress_tracking_screen_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';

class ProgressTrackingScreen extends GetView<ProgressTrackingScreenController> {
  const ProgressTrackingScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width*0.88;
    final screenHeight = MediaQuery.of(context).size.height*0.88;


    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: screenWidth * 0.10,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: screenWidth * 0.02),
                    child: Center(
                      child: Image(
                        image: const AssetImage(logoIcon),
                        width: screenWidth * 0.42,
                        height: screenHeight * 0.070,
                      ),
                    ),
                  ),
                  Obx(
                        () => CircleAvatar(
                      radius: screenWidth * 0.057,
                      backgroundImage: controller.doctorModel.value.image != ''
                          ? CachedNetworkImageProvider(
                          controller.doctorModel.value.image)
                          : (controller.userModel.value.image != ''
                          ? CachedNetworkImageProvider(
                          controller.userModel.value.image)
                          : const AssetImage('assets/images/person.png')
                      as ImageProvider),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.03,
                    bottom: screenHeight * 0.02,
                    left: screenWidth * 0.013),
                child: Row(
                  children: [
                    Text(
                      "Progress Tracking",
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: screenWidth * 0.045),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(bottom: screenHeight*0.030),
                child: Center(
                  child: Container(
                      width: screenWidth,
                      height: screenHeight*0.35,
                      decoration: BoxDecoration(
                        color: AppColors.secondaryBlue,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Obx(() => controller.isLoading.value
                          ? const Center(child: CircularProgressIndicator())
                          :
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical: screenHeight*0.028),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularPercentIndicator(
                                radius: screenWidth * 0.24,
                                lineWidth: 18.0,
                                animation: true,
                                percent: controller.speechExercisesScreenController.overallProgress.value / 100,

                                center: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${controller.speechExercisesScreenController.overallProgress.value.toStringAsFixed(1)}%', // Display the overallProgress value here

                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge!
                                          .copyWith(fontSize: screenWidth * 0.092),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      "Total Progress",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge!
                                          .copyWith(fontSize: screenWidth * 0.034),
                                      textAlign: TextAlign.center,

                                    ),
                                  ],
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: AppColors.primaryBlue,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                ),
              ),
              Obx(
                () => Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02), // Adjust the horizontal padding

                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,

                    ),
                    itemCount: controller
                        .speechExercisesScreenController.exerciseData.length,
                    /* Provide the count based on data length */
                    itemBuilder: (context, index) {
                      // Replace the below placeholder widgets with your actual data logic
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02), // Adjust the horizontal padding

                        decoration: BoxDecoration(
                          color: AppColors.secondaryBlue,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Obx(() => controller.isLoading.value
                            ? const Center(child: CircularProgressIndicator())
                            :
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularPercentIndicator(
                                radius: screenWidth * 0.098,
                                lineWidth: 9.0,
                                animation: true,
                                percent: controller
                                        .speechExercisesScreenController
                                        .exerciseData[index]
                                        .progress /
                                    100,
                                progressColor: AppColors.primaryBlue,
                                center: Center(
                                  child: Text(
                                    '${controller.speechExercisesScreenController.exerciseData[index].progress}%',
                                   textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(fontSize: screenWidth * 0.035),
                                  ),
                                ), /* Your percent value based on data */
                                // Center contents for the CircularPercentIndicator
                              ),
                               SizedBox(height: screenHeight*0.010),
                              Text(
                                controller.speechExercisesScreenController
                                    .exerciseData[index].title,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(fontSize: screenWidth * 0.035),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
