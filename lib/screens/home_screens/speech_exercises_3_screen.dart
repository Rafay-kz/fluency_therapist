import 'package:fluency_therapist/controller/home_screens_controller/speech_exercises_3_Screen_controller.dart';
import 'package:fluency_therapist/screens/home_screens/speech_exercises_4_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import 'home_screen.dart';

class SpeechExercises3Screen extends GetView<SpeechExercises3ScreenController> {
  final TimeOfDay time = const TimeOfDay(hour: 12, minute: 00);
  const SpeechExercises3Screen({super.key});
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
                        "Set reminders for daily practice",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: 20, color: AppColors.textColor),
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Practice makes you perfect and its more likely\nyou will form a habit if you practice daily at the\nsame time.",
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontSize: 15, color: AppColors.textColor),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.50,
                  decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      borderRadius: BorderRadius.circular(40)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                                top: 10, left: 10, right: 10, bottom: 10),
                            child: Image(
                              image: AssetImage(clockIcon),
                              width: 325,
                              height: 325,
                            ),
                          ),
                          Container(
                            width: 185,
                            height: 49,
                            decoration: BoxDecoration(
                                color: AppColors.secondaryBlue,
                                borderRadius: BorderRadius.circular(30)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(right: 5),
                                  child: Image(
                                    image: AssetImage(miniclockIcon),
                                    width: 35,
                                    height: 55,
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 25),
                                    child: Text(
                                        '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge!
                                            .copyWith(
                                                fontSize: 20,
                                                color: AppColors.textColor)),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {},
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 30),
                                    child: Image(
                                      image: AssetImage(downarrowIcon),
                                      width: 25,
                                      height: 225,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 15),
                child: Column(
                  children: [
                    Container(
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.07,
                      decoration: BoxDecoration(
                          color: AppColors.primaryBlue,
                          borderRadius: BorderRadius.circular(450)),
                      child: Center(
                          child: GestureDetector(
                            onTap: (){
                              Get.to(const SpeechExercises4Screen());
                            },
                            child: Text('Next',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                        fontSize: 17,
                                        color: AppColors.whiteColor)),
                          )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Later",
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 20, color: AppColors.textColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
