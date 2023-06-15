import 'package:fluency_therapist/controller/home_screens_controller/customized_program_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import 'home_screen.dart';

class CustomizedProgramScreen
    extends GetView<CustomizedProgramScreenController> {
  const CustomizedProgramScreen({super.key});

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
                          image: AssetImage(logoIcon), width: 168, height: 72),
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
                  padding: const EdgeInsets.only(right: 50, top: 25, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "What is your previous experience\nwith speech therapy?",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: 20, color: AppColors.textColor),
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "We will adjust the training plan accordingly",
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontSize: 15, color: AppColors.textColor),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50,left: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: screenWidth * 0.8,
                          height: screenHeight * 0.07,
                          decoration: BoxDecoration(
                              color: AppColors.secondaryBlue,
                              borderRadius: BorderRadius.circular(450)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Radio(
                                  value: 1,
                                  groupValue: "",
                                  onChanged: (value) {},
                                  activeColor: Colors.green,
                                  fillColor: MaterialStateProperty.all(
                                      Colors.blueAccent),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 70),
                                  child: Text(
                                    '0-6 months',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(
                                            fontSize: 17,
                                            color: AppColors.textColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50,left: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: screenWidth * 0.8,
                          height: screenHeight * 0.07,
                          decoration: BoxDecoration(
                              color: AppColors.secondaryBlue,
                              borderRadius: BorderRadius.circular(450)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Radio(
                                  value: 1,
                                  groupValue: "",
                                  onChanged: (value) {},
                                  activeColor: Colors.green,
                                  fillColor: MaterialStateProperty.all(
                                      Colors.blueAccent),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 70),
                                  child: Text(
                                    '2-3 months',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(
                                            fontSize: 17,
                                            color: AppColors.textColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50,left: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: screenWidth * 0.8,
                          height: screenHeight * 0.07,
                          decoration: BoxDecoration(
                              color: AppColors.secondaryBlue,
                              borderRadius: BorderRadius.circular(450)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Radio(
                                  value: 1,
                                  groupValue: "",
                                  onChanged: (value) {},
                                  activeColor: Colors.green,
                                  fillColor: MaterialStateProperty.all(
                                      Colors.blueAccent),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 70),
                                  child: Text(
                                    'More than 12 months',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(
                                            fontSize: 17,
                                            color: AppColors.textColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50,left: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: screenWidth * 0.8,
                          height: screenHeight * 0.07,
                          decoration: BoxDecoration(
                              color: AppColors.secondaryBlue,
                              borderRadius: BorderRadius.circular(450)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Radio(
                                  value: 1,
                                  groupValue: "",
                                  onChanged: (value) {},
                                  activeColor: Colors.green,
                                  fillColor: MaterialStateProperty.all(
                                      Colors.blueAccent),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 70),
                                  child: Text(
                                    'None',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(
                                            fontSize: 17,
                                            color: AppColors.textColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50,right: 30,left: 30),
                child: Column(
                  children: [
                    Container(
                      width: screenWidth * 0.8,
                      height: screenHeight * 0.07,
                      decoration: BoxDecoration(
                          color: AppColors.primaryBlue,
                          borderRadius: BorderRadius.circular(450)),
                      child: Center(
                          child: Text('Next',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                      fontSize: 17,
                                      color: AppColors.whiteColor))),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
