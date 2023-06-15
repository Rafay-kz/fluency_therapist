import 'package:fluency_therapist/controller/home_screens_controller/search_screen_controller.dart';
import 'package:fluency_therapist/screens/home_screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';

class SearchScreen extends GetView<SearchScreenController> {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 30, left: 30, top: 5),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.to(const HomeScreen());
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, right: 20, left: 60),
                    child: Center(
                      child: Image(
                          image: AssetImage(logoIcon),
                          width: 168,
                          height: 72),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 80),
                    child: CircleAvatar(
                      radius: 22,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Center(
                  child: SizedBox(
                    width: screenWidth * 0.9,
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: AppColors.textfieldColor,
                        filled: true,
                        hintText: 'Stuttering exercises',
                        hintStyle: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(
                                fontSize: 18, color: AppColors.textHintColor),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none),
                        prefixIcon: GestureDetector(
                          onTap: () {
                            Get.to(const SearchScreen());
                          },
                          child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 25, right: 10),
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
              ),
              Padding(
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
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10)),
                                child: LinearProgressIndicator(
                                  value: 0.0,
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
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10)),
                                child: LinearProgressIndicator(
                                  value: 0.0,
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
                          padding: const EdgeInsets.only(top: 25, right: 79),
                          child: Text(
                            "Prolonged\nSpeech",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(fontSize: 24),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, left: 18),
                          child: Text(
                            "Speak slowly and stretch out\nthe syllables in words",
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
                padding: const EdgeInsets.only(top: 15,bottom: 10),
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
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10)),
                                child: LinearProgressIndicator(
                                  value: 0.0,
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
                          padding: const EdgeInsets.only(top: 25, right: 60),
                          child: Text(
                            "Articulation\nDrills",
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
            ],
          ),
        ),
      ),
    );
  }
}
