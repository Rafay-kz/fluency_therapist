import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/user_screens_controller/home_screens_controller/user_profile_screen_controller.dart';
import '../../../custom widgets/button.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';

class UserProfileScreen extends GetView<UserProfileScreenController> {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width*0.88;
    final screenHeight = MediaQuery.of(context).size.height*0.88;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.05, vertical: screenHeight*0.02),
          child: Column(
              children: [
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
            Column(
              children: [
                Center(
                  child: Obx(
                    () => CircleAvatar(
                        radius: screenWidth*0.18,
                        backgroundImage: controller.userModel.value.image != ''
                            ? CachedNetworkImageProvider(
                                controller.userModel.value.image)
                            : const AssetImage('assets/images/person.png')
                                as ImageProvider),
                  ),
                ),
              ],
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
                        padding: EdgeInsets.only(top: screenHeight * 0.040, left:5),
                        child: Image(
                          image: const AssetImage(editProfileIcon),
                          width: screenWidth * 0.075,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.toNamed(kEditProfileScreen);
                        },
                        child: Padding(
                          padding:  EdgeInsets.only(left: screenWidth*0.034, top: screenHeight*0.04,),
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
                        padding:  EdgeInsets.only(left: screenWidth*0.034,),
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
            Padding(
              padding:  const EdgeInsets.only(top:10),
              child: SizedBox(
                width: screenWidth,
                child: Divider(
                  color: AppColors.textHintColor,
                ),
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
                          Get.toNamed(kProgressTrackingScreen);
                        },
                        child: Padding(
                          padding:  EdgeInsets.only(left: screenWidth*0.034, top: screenHeight*0.040),
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
                        padding:  EdgeInsets.only(left: screenWidth*0.034),
                        child: Text(
                          'Exercise progress and tracking ',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                              fontSize: screenWidth * 0.032,
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
                    width: screenWidth,
                    child: Divider(
                      color: AppColors.textHintColor,
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: screenHeight*0.080),
                  child: Button(
                      onPressed: () {
                        controller.logout();
                      },
                      text: "Logout"),
                )
              ]),
        ),
      ),
    );
  }
}
