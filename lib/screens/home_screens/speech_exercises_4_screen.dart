import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_screens_controller/speech_exercises_4_screen_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import 'home_screen.dart';

class SpeechExercises4Screen extends GetView<SpeechExercises4ScreenController> {
  const SpeechExercises4Screen({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 30, left: 30, top: 5),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.to(const HomeScreen());
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, right: 20, left: 60),
                    child: Center(
                      child: Image(
                          image: AssetImage(logoIcon), width: 168, height: 72),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 80),
                    child: CircleAvatar(
                      radius: 22,
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 50, top: 25, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Congratulations! Your Personalized\nTraining Plan Has Been Generated\nSuccessfully!",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: 20, color: AppColors.textColor),
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.23,
                  decoration: BoxDecoration(
                      color: AppColors.secondaryBlue,
                      borderRadius: BorderRadius.circular(40)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, right: 190, left: 30, bottom: 5),
                          child: Text(
                            "May",
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15, right: 50, left: 30, bottom: 10),
                          child: Text(
                            "Learn Slow and\nEasy Speech",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(fontSize: 24),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, left: 18),
                          child: Text(
                            "The most common technique\nto counter stuttering",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontSize: 15,
                                    color: AppColors.descriptionColor),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.23,
                  decoration: BoxDecoration(
                      color: AppColors.secondaryBlue,
                      borderRadius: BorderRadius.circular(40)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, right: 190, left: 30, bottom: 5),
                          child: Text(
                            "June",
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15, right: 50, left: 30, bottom: 10),
                          child: Text(
                            "Learn Slow and\nEasy Speech",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(fontSize: 24),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, left: 18),
                          child: Text(
                            "The most common technique\nto counter stuttering",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontSize: 15,
                                    color: AppColors.descriptionColor),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.23,
                  decoration: BoxDecoration(
                      color: AppColors.secondaryBlue,
                      borderRadius: BorderRadius.circular(40)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, right: 190, left: 30, bottom: 5),
                          child: Text(
                            "July",
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15, right: 50, left: 30, bottom: 10),
                          child: Text(
                            "Learn Slow and\nEasy Speech",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(fontSize: 24),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, left: 18),
                          child: Text(
                            "The most common technique\nto counter stuttering",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontSize: 15,
                                    color: AppColors.descriptionColor),
                          ),
                        ),
                      ]),
                    ],
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
