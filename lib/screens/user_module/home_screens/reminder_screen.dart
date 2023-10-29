import 'package:cached_network_image/cached_network_image.dart';

import '../../../controller/user_screens_controller/home_screens_controller/reminder_screen_controller.dart';
import '../../../custom widgets/button.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'home_screen.dart';

class ReminderScreen extends GetView<ReminderScreenController> {
  final TimeOfDay time = const TimeOfDay(hour: 12, minute: 00);

  const ReminderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 25, left: 25, top: 25),
          child: Column(children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.to(const HomeScreen());
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: screenWidth * 0.10,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 38, left: 38),
                  child: Center(
                    child: Image(
                      image: const AssetImage(logoIcon),
                      height: screenHeight * 0.075,
                      width: screenWidth * 0.42,
                    ),
                  ),
                ),
                Obx(()=>CircleAvatar(
                    radius: 25,
                    backgroundImage: controller.userModel.value.image!=''
                        ? CachedNetworkImageProvider(
                        controller.userModel.value.image
                    )
                        : const AssetImage('assets/images/person.png') as ImageProvider
                ),),
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 5),
                child: Row(
                  children: [
                    Text(
                      "Set reminders for daily practice",
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: screenWidth * 0.049,
                          color: AppColors.textColor),
                    ),
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Practice makes you perfect and its more likely\nyou will form a habit if you practice daily at the\nsame time.",
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontSize: screenWidth * 0.041,
                      color: AppColors.descriptionColor),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 25),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 25),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: Image(
                            image: const AssetImage(reminderBellImage),
                            width: screenWidth * 0.6,
                            height: screenHeight * 0.4,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            controller.pickTime(context);
                          },
                          child: Container(
                            width: screenWidth * 0.45,
                            height: screenHeight * 0.07,
                            decoration: BoxDecoration(
                              color: AppColors.secondaryBlue,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 13),
                                  child: Image(
                                    image: const AssetImage(reminderClockIcon),
                                    width: screenWidth * 0.045,
                                  ),
                                ),
                                Obx(() {
                                  return Text(
                                    controller.selectedTime.value
                                        .format(context),
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(
                                          fontSize: screenWidth * 0.035,
                                          color: AppColors.primaryBlue,
                                        ),
                                  );
                                }),
                                Icon(
                                  Icons.arrow_drop_down_sharp,
                                  color: AppColors.primaryBlue,
                                  size: 25,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Button(
                      onPressed: () {
                        Get.toNamed(kSpeechExercisesScreen);
                      },
                      text: "Next"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Later",
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontSize: 20,
                            color: AppColors.textColor,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
