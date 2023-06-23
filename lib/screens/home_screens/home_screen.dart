import 'package:fluency_therapist/screens/home_screens/progress_tracking_screen.dart';
import 'package:fluency_therapist/screens/home_screens/search_screen.dart';
import 'package:fluency_therapist/screens/home_screens/speech_exercises_screen.dart';
import 'package:fluency_therapist/screens/home_screens/user_profile_screen.dart';
import 'package:fluency_therapist/utils/app_colors.dart';
import 'package:fluency_therapist/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_screens_controller/home_screen_controller.dart';
import 'consult_therapist_screen.dart';
import 'customized_program_screen.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 25, left: 25, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  fontSize: screenWidth * 0.055,
                                  color: AppColors.primaryBlue),
                          children: [
                            const TextSpan(text: "Hello,"),
                            TextSpan(
                              text: "\nBilal Kz",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                      fontSize: screenWidth * 0.060,
                                      color: AppColors.textColor),
                            )
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 180),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(UserProfileScreen());
                        },
                        child: CircleAvatar(
                          radius: screenWidth * 0.06,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Center(
                    child: SizedBox(
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.076,
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: AppColors.textfieldColor,
                          filled: true,
                          hintText: 'Search a doctor or exercise...',
                          hintStyle: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  fontSize: screenWidth * 0.042,
                                  color: AppColors.textHintColor),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none),
                          prefixIcon: GestureDetector(
                            onTap: () {
                              Get.to(const SearchScreen());
                            },
                            child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 10),
                                child: Icon(
                                  Icons.search_sharp,
                                  size: screenWidth * 0.085,
                                  color: AppColors.textHintColor,
                                )),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Container(
                    width: screenWidth * 0.9,
                    height: screenHeight * 0.23,
                    decoration: BoxDecoration(
                        color: AppColors.secondaryBlue,
                        borderRadius: BorderRadius.circular(35)),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Image(
                                image: const AssetImage(parrotImage),
                                width: screenWidth * 0.30,
                                height: screenHeight * 0.20,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: SizedBox(
                                width: screenWidth * 0.29,
                                height: screenHeight * 0.011,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: LinearProgressIndicator(
                                    value: 0.3,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        AppColors.primaryBlue),
                                    backgroundColor: AppColors.textfieldColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 25, left: 5),
                                child: Text(
                                  "Learn Slow and\nEasy Speech",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(fontSize: screenWidth * 0.052),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6, left: 5),
                                child: Text(
                                  "The most common technique\nto counter stuttering",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                          fontSize: screenWidth * 0.029,
                                          color: AppColors.descriptionColor),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 45, top: 5),
                                child: TextButton(
                                    onPressed: () {
                                      Get.to(SpeechExercisesScreen());
                                    },
                                    child: Container(
                                      width: screenWidth * 0.19,
                                      height: screenHeight * 0.044,
                                      decoration: BoxDecoration(
                                          color: AppColors.primaryBlue,
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Center(
                                          child: Text(
                                        "Start",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                                fontSize: screenWidth * 0.035,
                                                color: AppColors.whiteColor),
                                      )),
                                    )),
                              )
                            ]),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 13, left: 2),
                      child: Text("Services",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontSize: screenWidth * 0.045)),
                    ),
                  ],
                ),
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15, top: 20),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(const CustomizedProgramScreen());
                      },
                      child: Container(
                        width: screenWidth * 0.38,
                        height: screenHeight * 0.16,
                        decoration: BoxDecoration(
                            color: AppColors.secondaryBlue,
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.all(4.5),
                          child: Column(
                            children: [
                              Image(
                                  image:
                                      const AssetImage(customizedProgramsIcon),
                                  width: screenWidth * 0.16,
                                  height: screenHeight * 0.090),
                              Text(
                                "Customized\nPrograms",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                      fontSize: screenWidth * 0.035,
                                    ),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 20),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(const SpeechExercisesScreen());
                      },
                      child: Container(
                        width: screenWidth * 0.38,
                        height: screenHeight * 0.16,
                        decoration: BoxDecoration(
                            color: AppColors.secondaryBlue,
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.all(4.5),
                          child: Column(
                            children: [
                              Image(
                                  image: AssetImage(speechExercisesIcon),
                                  width: screenWidth * 0.11,
                                  height: screenHeight * 0.090),
                              Text(
                                "Speech\nExercises",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                      fontSize: screenWidth * 0.035,
                                    ),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15, top: 25),
                    child: InkWell(
                      onTap: () {
                        Get.to(ProgressTrackingScreen());
                      },
                      child: Container(
                        width: screenWidth * 0.38,
                        height: screenHeight * 0.16,
                        decoration: BoxDecoration(
                            color: AppColors.secondaryBlue,
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.all(4.5),
                          child: Column(
                            children: [
                              Image(
                                  image: AssetImage(progressTrackingIcon),
                                  width: screenWidth * 0.11,
                                  height: screenHeight * 0.090),
                              Text(
                                "Progress\nTracking",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                      fontSize: screenWidth * 0.035,
                                    ),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 25),
                    child: InkWell(
                      onTap: () {
                        Get.to(ConsultTherapist());
                      },
                      child: Container(
                        width: screenWidth * 0.38,
                        height: screenHeight * 0.16,
                        decoration: BoxDecoration(
                            color: AppColors.secondaryBlue,
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.all(4.5),
                          child: Column(
                            children: [
                              Image(
                                  image: AssetImage(consultingIcon),
                                  width: screenWidth * 0.1,
                                  height: screenHeight * 0.090),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text(
                                  "Consult\nTherapist",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(
                                        fontSize: screenWidth * 0.035,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
