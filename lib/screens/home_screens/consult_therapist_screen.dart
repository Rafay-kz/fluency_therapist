import 'package:fluency_therapist/controller/home_screens_controller/consult_therapist_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import 'consultant_profile_screen.dart';

class ConsultTherapist extends GetView<ConsultTherapistScreenController> {
  const ConsultTherapist({super.key});

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
              Row(
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 20, left: 12, bottom: 20),
                    child: Text(
                      "Consult Therapists",
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 18),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Container(
                        width: 200,
                        height: 170,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryBlue,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Row(
                          children: [
                            const Padding(
                              padding:  EdgeInsets.only(
                                top: 30,
                                bottom: 30,
                                left: 30,
                                right: 20,
                              ),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 55,
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 30, left: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Dr M Ali Nizamani",
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge!
                                            .copyWith(
                                          fontSize: 20,
                                          color: AppColors.textColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2, left: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Pediatric Pathologist",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                          fontSize: 18,
                                          color: AppColors.descriptionColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2, left: 6),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                        size: 28,
                                      ),
                                     const  Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                        size: 28,
                                      ),
                                     const  Icon(
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
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                          color: AppColors.descriptionColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.to(ConsultantProfileScreen());
                                  },
                                  child: Container(
                                    width: 105,
                                    height: 33,
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryBlue,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Vew Profile",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                          fontSize: 14,
                                          color: AppColors.whiteColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
