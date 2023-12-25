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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;


    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15, right: 25, left: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                    padding:
                        const EdgeInsets.only(top: 10, right: 38, left: 38),
                    child: Center(
                      child: Image(
                        image: const AssetImage(logoIcon),
                        height: screenHeight * 0.075,
                        width: screenWidth * 0.42,
                      ),
                    ),
                  ),
                  Obx(() => CircleAvatar(
                        radius: 25,
                        backgroundImage: controller.doctorModel.value.image !=
                                ''
                            ? CachedNetworkImageProvider(
                                controller.doctorModel.value.image)
                            : (controller.userModel.value.image != ''
                                ? CachedNetworkImageProvider(
                                    controller.userModel.value.image)
                                : const AssetImage('assets/images/person.png')
                                    as ImageProvider),
                      )),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "Progress Tracking",
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 18),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Center(
                  child: Container(
                      width: screenWidth * 0.89,
                      height: screenHeight * 0.32,
                      decoration: BoxDecoration(
                        color: AppColors.secondaryBlue,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Obx(() => controller.isLoading.value
                          ? const Center(child: CircularProgressIndicator())
                          :
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularPercentIndicator(
                              radius: screenWidth * 0.24,
                              lineWidth: 18.0,
                              animation: true,
                              percent: 0.7,

                              center: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${controller.speechExercisesScreenController.overallProgress.value.toStringAsFixed(2)}%', // Display the overallProgress value here

                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(fontSize: screenWidth * 0.092),
                                  ),
                                  Text(
                                    "Total Progress%",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(fontSize: screenWidth * 0.034),
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
              Obx(
                () => Expanded(
                  child: GridView.builder(
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
                              const SizedBox(height: 10),
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
