import 'dart:io';

import 'package:fluency_therapist/controller/home_screens_controller/speech_exercises_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import 'home_screen.dart';

class SpeechExercisesScreen extends GetView<SpeechExercisesScreenController> {
  const SpeechExercisesScreen({super.key});

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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(const HomeScreen());
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
                   InkWell(
                     onTap: () {
                       Get.toNamed(kUserProfileScreen);
                     },
                     child:  Obx(()=> CircleAvatar(
                         radius:25,
                         backgroundImage: controller.userModel.value.image!=''
                             ? FileImage(
                             File(controller.userModel.value.image))
                             : null
                     ),
                     ),
                   ),

                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 50,top: 10,bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      "Speech Exercises",
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(
                          fontSize: screenWidth*0.045,
                          color: AppColors.textColor),
                    ),
                  ],
                ),
              ),

             Expanded(
               child: ListView.builder(
                   itemCount: 4,
                   itemBuilder: (BuildContext context, int index) {
                 return Padding(
                   padding: const EdgeInsets.only(top: 32),
                   child: Container(
                     width: screenWidth * 0.9,
                     height: screenHeight * 0.23,
                     decoration: BoxDecoration(
                         color: AppColors.secondaryBlue,
                         borderRadius: BorderRadius.circular(35)),
                     child: Row(
                       children: [
                         Column(
                           children: [
                             Padding(
                               padding:
                               const EdgeInsets.only(left: 15 ),
                               child: Image(
                                 image: const AssetImage(parrotImage),
                                 width: screenWidth * 0.30,
                                 height: screenHeight * 0.20,
                               ),
                             ),
                             Padding(
                               padding:  const EdgeInsets.only(left: 30),
                               child: SizedBox(
                                 width: screenWidth*0.29,
                                 height: screenHeight*0.011,
                                 child: ClipRRect(
                                   borderRadius:
                                   const BorderRadius.all(Radius.circular(10)),
                                   child: LinearProgressIndicator(
                                     value: 0.3,
                                     valueColor: AlwaysStoppedAnimation<Color>(
                                         AppColors.primaryBlue),
                                     backgroundColor: AppColors.textfieldColor,
                                   ),
                                 ),
                               ),
                             ),
                           ],
                         ),
                         Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [

                               Padding(
                                 padding: const EdgeInsets.only(top: 25, left:5 ),
                                 child: Text(
                                   "Learn Slow and\nEasy Speech",
                                   style: Theme.of(context)
                                       .textTheme
                                       .displayLarge!
                                       .copyWith(fontSize: screenWidth*0.052),
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(top: 6, left: 5),
                                 child: Text(
                                   "The most common technique\nto counter stuttering",
                                   style: Theme.of(context)
                                       .textTheme
                                       .headlineSmall!
                                       .copyWith(
                                       fontSize: screenWidth*0.029,
                                       color: AppColors.descriptionColor),
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(left: 45, top: 5 ),
                                 child: TextButton(
                                     onPressed: () {
                                       Get.toNamed(kCustomizeProgramFinalScreen);},
                                     child: Container(
                                       width: screenWidth*0.19,
                                       height: screenHeight*0.044,
                                       decoration: BoxDecoration(
                                           color: AppColors.primaryBlue,
                                           borderRadius: BorderRadius.circular(30)),
                                       child: Center(
                                           child: Text(
                                             "Start",
                                             style: Theme.of(context)
                                                 .textTheme
                                                 .headlineSmall!
                                                 .copyWith(
                                                 fontSize: screenWidth*0.035,
                                                 color: AppColors.whiteColor),
                                           )),
                                     )),
                               )
                             ]),
                       ],
                     ),
                   ),
                 );
               }),
             )
            ],
          ),
        ),
      ),
    );
  }
}
