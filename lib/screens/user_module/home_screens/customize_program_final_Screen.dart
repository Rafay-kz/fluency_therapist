import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/user_screens_controller/home_screens_controller/customize_program_final_screen_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';




class CustomizeProgramFinalScreen extends GetView<CustomizeProgramFinalScreenController> {
  const CustomizeProgramFinalScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 25, left: 25, top: 25),
          child: Column(
            children: [
              Row(

                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child:  Icon(
                      Icons.arrow_back,
                      size: screenWidth*0.10,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 38, left: 38),
                    child: Center(
                      child: Image(
                        image: const AssetImage(logoIcon),
                        height: screenHeight * 0.075,
                        width: screenWidth * 0.42,),
                    ),
                  ),
                  Obx(()=> CircleAvatar(
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
              Padding(
                  padding: const EdgeInsets.only( top: 25, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Congratulations! Your Personalized\nTraining Plan Has Been Generated\nSuccessfully!",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: screenWidth*0.045, ),
                      ),
                    ],
                  )),
              Expanded(
                child: ListView.builder(
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
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
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20,  left: 30, bottom: 15),
                              child: Text(
                                "May",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(fontSize: screenWidth*0.045),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                    left: 30, bottom: 6),
                              child: Text(
                                "Learn Slow and\nEasy Speech",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(fontSize: screenWidth*0.055),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only( left: 30),
                              child: Text(
                                "The most common technique\nto counter stuttering",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        fontSize: screenWidth*0.035,
                                        color: AppColors.descriptionColor),
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                  ); }
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
