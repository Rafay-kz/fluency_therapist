import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/user_screens_controller/home_screens_controller/calling_consultant_screen_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';

class CallingConsultantScreen
    extends GetView<CallingConsultantScreenController> {
  const CallingConsultantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
          child: SingleChildScrollView(
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                    padding: EdgeInsets.only(top: 10, right: 38, left: 38),
                    child: Center(
                      child: Image(
                        image: AssetImage(logoIcon),
                        width: screenWidth * 0.42,
                        height: screenHeight * 0.075,
                      ),
                    ),
                  ),
                  Obx(
                        () => CircleAvatar(
                      radius: 25,
                      backgroundImage: controller.doctorModel.value.image != ''
                          ? CachedNetworkImageProvider(controller.doctorModel.value.image)
                          : (controller.userModel.value.image != ''
                          ? CachedNetworkImageProvider(controller.userModel.value.image)
                          : const AssetImage('assets/images/person.png') as ImageProvider),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  "Calling",
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: screenWidth * 0.045,
                        color: AppColors.textColor,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CircleAvatar(
                  radius: screenWidth * 0.15,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text(
                  "Dr M Ali\nNizamani",
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: screenWidth * 0.055,
                        color: AppColors.textColor,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.30),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Container(
                        width: screenWidth * 0.16,
                        height: screenHeight * 0.08,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryBlue,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.mic_off,
                          size: screenWidth * 0.09,
                          color: AppColors.primaryBlue,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Container(
                        width: screenWidth * 0.16,
                        height: screenHeight * 0.08,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryBlue,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.video_call,
                          size: screenWidth * 0.09,
                          color: AppColors.primaryBlue,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Container(
                        width: screenWidth * 0.16,
                        height: screenHeight * 0.08,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryBlue,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.volume_up_rounded,
                          size: screenWidth * 0.09,
                          color: AppColors.primaryBlue,
                        )),
                  ),
                  Container(
                      width: screenWidth * 0.16,
                      height: screenHeight * 0.08,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(
                        Icons.call_end,
                        size: screenWidth * 0.09,
                        color: AppColors.whiteColor,
                      )),
                ]),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
