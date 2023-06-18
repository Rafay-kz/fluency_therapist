import 'package:fluency_therapist/controller/home_screens_controller/customized_program_screen_controller.dart';
import 'package:fluency_therapist/utils/widgets/button.dart';
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
          padding: const EdgeInsets.only(right: 25, left: 25, top: 25),
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
                    padding: EdgeInsets.only(top: 10, right: 90, left: 90),
                    child: Center(
                      child: Image(
                          image: AssetImage(logoIcon), width: 158, height: 62),
                    ),
                  ),
                  const CircleAvatar(
                    radius: 22,
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:10, top: 30),
                    child: Text(
                      "What is your previous experience\nwith speech therapy?",
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 22, color: AppColors.textColor),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:10, top:7),
                    child: Text(
                      "We will adjust the training plan accordingly.",
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontSize: 17, color: AppColors.descriptionColor),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top:30),
                child: Row(
                  children: [
                    Container(
                      width: screenWidth * 0.89,
                      height: screenHeight * 0.075,
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
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                '0-6 months',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                        fontSize: 18,
                                        color: AppColors.textColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35,),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: screenWidth * 0.89,
                          height: screenHeight * 0.075,
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
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    '2-3 months',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(
                                            fontSize: 18,
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
                padding: const EdgeInsets.only(top: 35),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: screenWidth * 0.89,
                          height: screenHeight * 0.075,
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
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    'More than 12 months',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(
                                            fontSize: 18,
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
                padding: const EdgeInsets.only(top: 35),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: screenWidth * 0.89,
                          height: screenHeight * 0.075,
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
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    'None',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(
                                            fontSize: 18,
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
               padding: const EdgeInsets.only(top: 70),
               child: Button(onPressed: () {}, text: "Next"),
             ),
            ],
          ),
        ),
      ),
    );
  }
}
