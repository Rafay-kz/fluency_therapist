import 'package:fluency_therapist/utils/app_colors.dart';
import 'package:fluency_therapist/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_screens_controller/home_screen_controller.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 30, left: 30, top: 25),
          child: Column(
            children: [
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            fontSize: 22, color: AppColors.primaryBlue),
                        children: [
                          const TextSpan(text: "Hello,"),
                          TextSpan(
                            text: "\nBilal Kz",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                    fontSize: 25, color: AppColors.textColor),
                          )
                        ]),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 275),
                    child: CircleAvatar(
                      radius: 22,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Center(
                  child: SizedBox(
                    width: screenWidth * 0.9,
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: AppColors.textfieldColor,
                        filled: true,
                        hintText: 'Search a doctor or exercise',
                        hintStyle: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(
                                fontSize: 18, color: AppColors.textHintColor),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none),
                        prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 25, right: 10),
                            child: Icon(
                              Icons.search_outlined,
                              size: 35,
                              color: AppColors.textHintColor,
                            )),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
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
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 25, left: 20),
                            child: Image(
                              image: AssetImage(parrotImage),
                              width: 125,
                              height: 125,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: SizedBox(
                              width: 135,
                              height: 11,
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
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25, right: 16),
                          child: Text(
                            "Learn Slow and\nEasy Speech",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(fontSize: 24),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, left: 18),
                          child: Text(
                            "The most common technique\nto counter stuttering",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontSize: 15,
                                    color: AppColors.descriptionColor),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50, top: 10),
                          child: TextButton(
                              onPressed: () {},
                              child: Container(
                                width: 75,
                                height: 33,
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
                                          fontSize: 14,
                                          color: AppColors.whiteColor),
                                )),
                              )),
                        )
                      ]),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, right: 325),
                child: Text("Services",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 18)),
              ),
              Row(children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15, top: 20),
                  child: Container(
                    width: screenWidth * 0.40,
                    height: screenHeight * 0.18,
                    decoration: BoxDecoration(
                        color: AppColors.secondaryBlue,
                        borderRadius: BorderRadius.circular(35)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(
                          image:  AssetImage(customizedProgramsIcon),
                          width: 85,
                          height: 55,
                        ),
                        Padding(padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            "Customized\nPrograms",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                  fontSize: 16,
                                ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 20),
                  child: Container(
                    width: screenWidth * 0.40,
                    height: screenHeight * 0.18,
                    decoration: BoxDecoration(
                        color: AppColors.secondaryBlue,
                        borderRadius: BorderRadius.circular(35)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(
                          image:  AssetImage(speechExercisesIcon),
                          width: 85,
                          height: 55,
                        ),
                        Padding(padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            "Speech\nExercises",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ]),
              Row(children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15, top: 25),
                  child: Container(
                    width: screenWidth * 0.40,
                    height: screenHeight * 0.18,
                    decoration: BoxDecoration(
                        color: AppColors.secondaryBlue,
                        borderRadius: BorderRadius.circular(35)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(
                          image:  AssetImage(progressTrackingIcon),
                          width: 75,
                          height: 45,
                        ),
                        Padding(padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            "Progress\nTracking",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 25),
                  child: Container(
                    width: screenWidth * 0.40,
                    height: screenHeight * 0.18,
                    decoration: BoxDecoration(
                        color: AppColors.secondaryBlue,
                        borderRadius: BorderRadius.circular(35)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(
                          image:  AssetImage(consultingIcon),
                          width: 85,
                          height: 55,
                        ),
                        Padding(padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            "Consult\nTherapist",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
