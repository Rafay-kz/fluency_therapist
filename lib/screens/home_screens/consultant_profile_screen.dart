import 'package:fluency_therapist/controller/home_screens_controller/consultant_profile_screen_controller.dart';
import 'package:fluency_therapist/screens/home_screens/ongoing_call_screen.dart';
import 'package:fluency_therapist/utils/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import 'calling_consultant_screen.dart';
import 'consultant_calling_screen.dart';

class ConsultantProfileScreen
    extends GetView<ConsultantProfileScreenController> {
  const ConsultantProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  IconButton(
                    onPressed: () {
                      Get.back();
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
                        image: AssetImage(logoIcon),
                        width: 158,
                        height: 62,
                      ),
                    ),
                  ),
                  const CircleAvatar(
                    radius: 22,
                  ),
                ],
              ),
              const Padding(
                padding:  EdgeInsets.only(top: 20),
                child: CircleAvatar(
                  radius: 80,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text(
                  "Dr M Ali Nizamani",
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 22,
                        color: AppColors.textColor,
                      ),
                ),
              ),
              Text(
                "Pediatric Pathologist",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: 16,
                      color: AppColors.descriptionColor,
                    ),
              ),
              Padding(
                padding: const EdgeInsets.only( top: 15, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 28,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 28,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 28,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 28,
                    ),
                    const Icon(
                      Icons.star_half,
                      color: Colors.orange,
                      size: 28,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "109 reviews",
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            color: AppColors.textHintColor,
                        fontSize: 13,
                          ),
                    ),
                  ],
                ),
              ),
              Text(
                "A highly skilled Pediatric pathalogosit with a proven track record of transforming lives through effective communication interventions",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontSize: 15,
                      color: AppColors.textHintColor,
                    ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Container(
                  width: 600,
                  height: 90,
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
                              size: 50,
                              color: AppColors.primaryBlue,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 24),
                            child: Text(
                              "Availability",
                              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                fontSize: 18,
                                color: AppColors.textColor,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 3),
                            child: Text(
                              "08:00 AM to 05:00 PM",
                              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                fontSize: 12,
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
                padding: const EdgeInsets.only(bottom: 40),
                child: Container(
                  width: 600,
                  height: 90,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryBlue,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20, left: 25),
                          child: Icon(
                            Icons.location_on_outlined,
                            size: 50,
                            color: AppColors.primaryBlue,
                          ),
                        ),

                    ],),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Padding(
                      padding: const EdgeInsets.only(left: 20, top: 24),
                      child: Text(
                        "Location",
                        style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: 18,
                          color: AppColors.textColor,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 3),
                        child: Text(
                          "Lumhs, Jamshoro",
                          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontSize: 12,
                            color: AppColors.descriptionColor,
                          ),
                        ),
                      ),],)
                  ],),
                ),
              ),
              Button(onPressed: () {
                Get.to(OngoingCallScreen());
              }, text: "Book an Appointment"),
            ],
          ),
        ),
      ),
    );
  }
}
