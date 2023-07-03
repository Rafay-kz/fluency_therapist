import 'package:fluency_therapist/controller/home_screens_controller/customized_program_screen_controller.dart';
import '../../custom widgets/button.dart';
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
                   CircleAvatar(
                    radius: screenWidth*0.06,
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only( top: 25),
                    child: Text(
                      "What is your previous experience\nwith speech therapy?",
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: screenWidth*0.048, color: AppColors.textColor),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:7),
                    child: Text(
                      "We will adjust the training plan accordingly.",
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontSize: screenWidth*0.041, color: AppColors.descriptionColor),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                 itemCount:4,
                 itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(top:30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: screenWidth * 0.861,
                          height: screenHeight * 0.076,
                          decoration: BoxDecoration(
                              color: AppColors.secondaryBlue,
                              borderRadius: BorderRadius.circular(50)),
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
                                            fontSize: screenWidth*0.045,
                                            color: AppColors.textColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ); }
                ),
              ),


             Padding(
               padding: const EdgeInsets.only(bottom: 50),
               child: Button(onPressed: () {
                 Get.toNamed(kReminderScreen);
               }, text: "Next"),
             ),
            ],
          ),
        ),
      ),
    );
  }
}
