import 'dart:io';
import 'package:fluency_therapist/screens/home_screens/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_screens_controller/user_profile_screen_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../custom widgets/button.dart';

class UserProfileScreen extends GetView<UserProfileScreenController> {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
              ],
            ),
            Obx((){
              return Column
                (
                children: [
                  Center(
                    child: CircleAvatar(
                        radius: screenWidth * 0.15,

                        backgroundImage: controller.imagePath.isNotEmpty ? FileImage(File(controller.imagePath.toString())) : null
                    ),
                  ),
                  TextButton(onPressed: (){
                    controller.imagePickerOption();

                  }, child: const Text("Change Photo"))
                ],
              );
            }),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 5),
              child: Text(
                "Dr M Ali Nizamani",
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: screenWidth * 0.050,
                      color: AppColors.textColor,
                    ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(kEditProfileScreen);
              },
              child: Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Image(
                          image: const AssetImage(editProfileIcon),
                          width: screenWidth * 0.075,
                          height: screenHeight * 0.075,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to( EditProfileScreen());
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, top: 16),
                          child: Text(
                            "Edit Profile",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                  fontSize: screenWidth * 0.038,
                                  color: AppColors.textColor,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          'Name, photo, email etc. ',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  fontSize: screenWidth * 0.030,
                                  color: AppColors.descriptionColor),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              width: screenWidth * 0.9,
              child: Divider(
                color: AppColors.textHintColor,
              ),
            ),
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Icon(Icons.messenger_outline_sharp,
                          size: screenWidth * 0.078,
                          color: AppColors.primaryBlue),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(kInboxScreen);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, top: 16),
                        child: Text(
                          "Inbox",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                fontSize: screenWidth * 0.038,
                                color: AppColors.textColor,
                              ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        'Conversations with Consultants ',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                fontSize: screenWidth * 0.030,
                                color: AppColors.descriptionColor),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              width: screenWidth * 0.95,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Divider(
                  color: AppColors.textHintColor,
                ),
              ),
            ),
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Image(
                        image: const AssetImage(billingDetailsIcon),
                        width: screenWidth * 0.075,
                        height: screenHeight * 0.075,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(kEditProfileScreen);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, top: 16),
                        child: Text(
                          "Billing Details",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                fontSize: screenWidth * 0.038,
                                color: AppColors.textColor,
                              ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        'Payment and billing details',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                fontSize: screenWidth * 0.030,
                                color: AppColors.descriptionColor),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              width: screenWidth * 0.9,
              child: Divider(
                color: AppColors.textHintColor,
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(kProgressTrackingScreen);
              },
              child: Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Image(
                            image: const AssetImage(progressIcon),
                            width: screenWidth * 0.075,
                            height: screenHeight * 0.045),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(kEditProfileScreen);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, top: 25),
                          child: Text(
                            "Progress Tracking",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                  fontSize: screenWidth * 0.038,
                                  color: AppColors.textColor,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          'Exercise progress and tracking ',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  fontSize: screenWidth * 0.030,
                                  color: AppColors.descriptionColor),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                width: screenWidth * 0.95,
                child: Divider(
                  color: AppColors.textHintColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Button(
                  onPressed: () {
                    Get.toNamed(kLoginScreen);
                  },
                  text: "Logout"),
            )
          ]),
        ),
      ),
    );
  }
}
