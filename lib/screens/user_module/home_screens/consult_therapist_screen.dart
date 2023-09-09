import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/user_screens_controller/home_screens_controller/consult_therapist_screen_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';



class ConsultTherapistScreen extends GetView<ConsultTherapistScreenController> {
  const ConsultTherapistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only( right: 25, left: 25),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: screenWidth*0.10,
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(top: 10, right: 38, left: 38),
                    child: Center(
                      child: Image(
                        image: const AssetImage(logoIcon),
                        width: screenWidth * 0.42,
                        height: screenHeight * 0.075,
                      ),
                    ),
                  ),
                  Obx(()=>  CircleAvatar(
                      radius: 25,
                      backgroundImage: controller.userModel.value.image!=''
                          ? CachedNetworkImageProvider(
                          controller.userModel.value.image
                      )
                          : const AssetImage('assets/images/person.png') as ImageProvider
                  ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 20, left: 12, bottom: 20),
                    child: Text(
                      "Consult Therapists",
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: screenWidth*0.045),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Container(
                        width: screenWidth * 0.9,
                        height: screenHeight * 0.23,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryBlue,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Row(
                          children: [
                             Padding(
                              padding:  const EdgeInsets.only(
                                top: 30,
                                bottom: 30,
                                left: 20,
                                right: 10,
                              ),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: screenWidth*0.13,
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 30, left: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        "\n Dr.${controller.doctorModel.value.userName}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge!
                                            .copyWith(
                                          fontSize: screenWidth*0.040,
                                          color: AppColors.textColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2, left: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Pediatric Pathologist",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                          fontSize: screenWidth*0.040,
                                          color: AppColors.descriptionColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2, left: 8),
                                  child: Row(
                                    children: [
                                       Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                        size: screenWidth*0.07,
                                      ),
                                       Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                        size: screenWidth*0.07,
                                      ),
                                       Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                        size: screenWidth*0.07,
                                      ),
                                       Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                        size: screenWidth*0.07,
                                      ),
                                     const Icon(
                                        Icons.star_half,
                                        color: Colors.orange,
                                        size: 28,
                                      ),
                                      const SizedBox(width: 2),
                                      Text(
                                        "109 reviews",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                          color: AppColors.descriptionColor,
                                          fontSize: screenWidth*0.020
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.toNamed(kConsultantProfileScreen);
                                  },
                                  child: Container(
                                    width: screenWidth*0.27,
                                    height: screenHeight* 0.046,
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryBlue,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Vew Profile",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                          fontSize: screenWidth*0.035,
                                          color: AppColors.whiteColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
