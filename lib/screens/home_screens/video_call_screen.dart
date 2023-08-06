import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_screens_controller/video_call_screen_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';

class VideoCallScreen extends GetView<VideoCallScreenController> {
  const VideoCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return  Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
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
                      size: screenWidth*0.10,
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
                  Obx(()=> CircleAvatar(
                      radius:25,
                      backgroundImage: controller.userModel.value.image!=''
                          ? FileImage(
                          File(controller.userModel.value.image))
                          : null
                  ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  "Connected",
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: screenWidth*0.045,
                    color: AppColors.textColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "01:00",
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: screenWidth*0.045,
                    color: AppColors.textColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                  height: screenHeight*0.45,
                  width: screenWidth*0.9,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://s2.dmcdn.net/v/SAnRj1Vo1k1scKler/x1080'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  "Dr M Ali\nNizamani",
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: screenWidth*0.055,
                    color: AppColors.textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: screenHeight*0.040),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only( right: 25),
                        child: Container(
                            width: screenWidth*0.16,
                            height: screenHeight*0.08,
                            decoration: BoxDecoration(
                              color: AppColors.secondaryBlue,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              Icons.mic_off,
                              size: screenWidth*0.09,
                              color: AppColors.primaryBlue,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: Container(
                            width: screenWidth*0.16,
                            height: screenHeight*0.08,
                            decoration: BoxDecoration(
                              color: AppColors.secondaryBlue,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              Icons.video_call,
                              size: screenWidth*0.09,
                              color: AppColors.primaryBlue,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only( right: 25),
                        child: Container(
                            width: screenWidth*0.16,
                            height: screenHeight*0.08,
                            decoration: BoxDecoration(
                              color: AppColors.secondaryBlue,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(
                              Icons.volume_up_rounded,
                              size: screenWidth*0.09,
                              color: AppColors.primaryBlue,
                            )),
                      ),
                      Container(
                          width: screenWidth*0.16,
                          height: screenHeight*0.08,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Icon(
                            Icons.call_end,
                            size: screenWidth*0.09,
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