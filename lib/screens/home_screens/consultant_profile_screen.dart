import 'package:fluency_therapist/controller/home_screens_controller/consultant_profile_screen_controller.dart';
import '../../custom widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';


class ConsultantProfileScreen
    extends GetView<ConsultantProfileScreenController> {
  const ConsultantProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 25, right: 25, left: 25),
          child: Column(
            children: [
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
                    padding: const EdgeInsets.only(top: 10, right: 38, left: 38),
                    child: Center(
                      child: Image(
                        image: const AssetImage(logoIcon),
                        width: screenWidth * 0.42,
                        height: screenHeight * 0.075,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: screenWidth*0.06,
                  ),
                ],
              ),
               Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CircleAvatar(
                  radius: screenWidth*0.15,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Dr M Ali Nizamani",
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: screenWidth*0.050,
                        color: AppColors.textColor,
                      ),
                ),
              ),
              Text(
                "Pediatric Pathologist",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: screenWidth*0.035,
                      color: AppColors.descriptionColor,
                    ),
              ),
              Padding(
                padding: const EdgeInsets.only( top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: screenWidth*0.06,
                    ),
                     Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: screenWidth*0.07,
                    ),
                     Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: screenWidth*0.07,
                    ),
                     Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: screenWidth*0.07,
                    ),
                     Icon(
                      Icons.star_half,
                      color: Colors.orange,
                      size: screenWidth*0.07,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "109 reviews",
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            color: AppColors.textHintColor,
                        fontSize: screenWidth*0.032,
                          ),
                    ),
                  ],
                ),
              ),
              Text(
                "A highly skilled Pediatric pathologist with a proven track record of transforming lives through effective communication interventions",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: screenWidth*0.032,
                      color: AppColors.textHintColor,
                    ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Container(
                  width: screenWidth*0.9,
                  height: screenHeight*0.12,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryBlue,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 20, left: 25),
                            child: Icon(
                              Icons.calendar_month_outlined,
                              size: screenWidth*0.11,
                              color: AppColors.primaryBlue,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 24),
                            child: Text(
                              "Availability",
                              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                fontSize: screenWidth*0.045,
                                color: AppColors.textColor,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 3),
                            child: Text(
                              "08:00 AM to 05:00 PM",
                              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                fontSize: screenWidth*0.030,
                                color: AppColors.descriptionColor,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Container(
                  width: screenWidth*0.9,
                  height: screenHeight*0.12,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryBlue,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 19, bottom: 19, left: 25),
                          child: Icon(
                            Icons.location_on_outlined,
                            size: screenWidth*0.12,
                            color: AppColors.primaryBlue,
                          ),
                        ),

                    ],),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Padding(
                      padding: const EdgeInsets.only(left: 15, top: 24),
                      child: Text(
                        "Location",
                        style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: screenWidth*0.045,
                          color: AppColors.textColor,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 3),
                        child: Text(
                          "Lumhs, Jamshoro",
                          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontSize: screenWidth*0.030,
                            color: AppColors.descriptionColor,
                          ),
                        ),
                      ),],)
                  ],),
                ),
              ),
              Button(onPressed: () {
                Get.toNamed(kChatWithConsultantScreen);
              }, text: "Book an Appointment"),
            ],
          ),
        ),
      ),
    );
  }
}
