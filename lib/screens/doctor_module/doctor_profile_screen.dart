import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/user_screens_controller/home_screens_controller/user_profile_screen_controller.dart';
import '../../../custom widgets/button.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';
import '../../controller/doctor_screens_controller/doctor_profile_screen_controller.dart';



class DoctorProfileScreen extends GetView<DoctorProfileScreenController> {
  DoctorProfileScreen({super.key});

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
            Column(
              children: [
                Center(
                  child: Obx(()=> CircleAvatar(
                      radius: 40,
                      backgroundImage: controller.doctorModel.value.image!=''
                          ? CachedNetworkImageProvider(
                          controller.doctorModel.value.image
                      )
                          : const AssetImage('assets/images/person.png') as ImageProvider
                  ),
                  ),
                ),

              ],
            ),


            InkWell(
              onTap: () {
                Get.toNamed(kDoctorEditProfileScreen);
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
                          Get.toNamed(kDoctorEditProfileScreen);
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
