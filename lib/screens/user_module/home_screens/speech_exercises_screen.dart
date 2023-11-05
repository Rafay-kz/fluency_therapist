import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/user_screens_controller/home_screens_controller/speech_exercises_screen_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';

class SpeechExercisesScreen extends GetView<SpeechExercisesScreenController> {
  const SpeechExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    List<String> screenNames = [
      kExercisesScreenOne,
      kExercisesScreenTwo,
      kExercisesScreenThree // Add more screen names as needed
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 25, left: 25, top: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                  InkWell(
                    onTap: () {
                      Get.toNamed(kUserProfileScreen);
                    },
                    child: Obx(
                      () => CircleAvatar(
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
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 50, top: 10, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Speech Exercises",
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: screenWidth * 0.045,
                          color: AppColors.textColor),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: controller.exerciseData.length,
                    itemBuilder: (BuildContext context, int index) {
                      ExerciseData data = controller.exerciseData[index];
                      {
                        return Padding(
                          padding: const EdgeInsets.only(top: 32),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 8),
                            decoration: BoxDecoration(
                                color: AppColors.secondaryBlue,
                                borderRadius: BorderRadius.circular(35)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image(
                                      image: const AssetImage(parrotImage),
                                      width: screenWidth * 0.30,
                                      height: screenHeight * 0.20,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data.title,
                                            // Use the title from ExerciseData
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayLarge!
                                                .copyWith(
                                                  fontSize: screenWidth * 0.055,
                                                ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            data.description,
                                            // Use the description from ExerciseData
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall!
                                                .copyWith(
                                                  fontSize: screenWidth * 0.030,
                                                  color: AppColors.textColor,
                                                ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: screenWidth * 0.29,
                                        height: screenHeight * 0.011,
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
                                          child: LinearProgressIndicator(
                                            value: 0.3,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    AppColors.primaryBlue),
                                            backgroundColor:
                                                AppColors.textfieldColor,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          if (index < screenNames.length) {
                                            String screenName =
                                                screenNames[index];
                                            Get.toNamed(screenName);
                                          } else {
                                            // Handle index out of bounds error
                                          }
                                        },
                                        child: Container(
                                          width: screenWidth * 0.19,
                                          height: screenHeight * 0.044,
                                          decoration: BoxDecoration(
                                            color: AppColors.primaryBlue,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Start",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall!
                                                  .copyWith(
                                                    fontSize:
                                                        screenWidth * 0.035,
                                                    color: AppColors.whiteColor,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ]),
                              ],
                            ),
                          ),
                        );
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
