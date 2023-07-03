import 'package:fluency_therapist/utils/app_colors.dart';
import 'package:fluency_therapist/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_screens_controller/home_screen_controller.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 25, left: 25, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  fontSize: Get.width * 0.055,
                                  color: AppColors.primaryBlue),
                          children: [
                            const TextSpan(text: "Hello,"),
                            TextSpan(
                              text: "\nBilal Kz",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                      fontSize: Get.width * 0.060,
                                      color: AppColors.textColor),
                            )
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 180),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(kUserProfileScreen);
                        },
                        child: CircleAvatar(
                          radius: Get.width * 0.06,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Center(
                    child: SizedBox(
                      width: Get.width * 0.9,
                      height: Get.height * 0.076,
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: AppColors.textfieldColor,
                          filled: true,
                          hintText: 'Search a doctor or exercise...',
                          hintStyle: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  fontSize: Get.width * 0.042,
                                  color: AppColors.textHintColor),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none),
                          prefixIcon: GestureDetector(
                            onTap: () {
                              Get.toNamed(kSearchScreen);
                            },
                            child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 10),
                                child: Icon(
                                  Icons.search_sharp,
                                  size: Get.width * 0.085,
                                  color: AppColors.textHintColor,
                                )),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Container(
                    width: Get.width,
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 8),
                    decoration: BoxDecoration(
                        color: AppColors.secondaryBlue,
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Image(
                                  image: const AssetImage(parrotImage),
                                  width: Get.width * 0.30,
                                  height: Get.height * 0.20,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: SizedBox(
                                  width: Get.width * 0.29,
                                  height: Get.height * 0.011,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
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
                        ),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 5),
                                  child: Text(
                                    "Learn Slow and\nEasy Speech",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(fontSize: Get.width * 0.052),
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
                                            fontSize: Get.width * 0.029,
                                            color: AppColors.descriptionColor),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 45, top: 5),
                                  child: TextButton(
                                      onPressed: () {
                                        Get.toNamed(kSpeechExercisesScreen);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: AppColors.primaryBlue,
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 7),
                                        child: Center(
                                            child: Text(
                                          "Start",
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall!
                                              .copyWith(
                                                  fontSize: Get.width * 0.035,
                                                  color: AppColors.whiteColor),
                                        )),
                                      )),
                                )
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 13, left: 2),
                    child: Text("Services",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: Get.width * 0.045)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                      children: [
                        cardWidget(context: context, title: "Customized\nPrograms", image: customizedProgramsIcon, routeName: kCustomizedProgramScreen),
                    const SizedBox(width: 20,),
                        cardWidget(context: context, title: "Speech\nExercises", image: speechExercisesIcon,routeName: kSpeechExercisesScreen,),
                  ]),
                ),
                Row(
                    children: [
                      cardWidget(context: context, title: "Progress\nTracking", image: progressTrackingIcon, routeName: kProgressTrackingScreen,),
                      const SizedBox(width: 20,),
                      cardWidget(context: context, title: "Consult\nTherapist", image: consultingIcon, routeName: kConsultTherapistScreen),
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget cardWidget({required BuildContext context,required String title, required String image,required String routeName}){
    return  Expanded(
      child: GestureDetector(
        onTap: (){
          Get.toNamed(routeName);
        },
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.secondaryBlue,
              borderRadius: BorderRadius.circular(30)),
          child: Padding(
            padding:  const EdgeInsets.symmetric(horizontal: 4.5,vertical: 10),
            child: Column(
              children: [
                Image(
                    image:
                   AssetImage(image),
                    width: Get.width * 0.16,
                    height: Get.height * 0.090),
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(
                    fontSize: Get.width * 0.035,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
