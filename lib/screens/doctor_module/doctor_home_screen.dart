
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluency_therapist/utils/app_colors.dart';
import 'package:fluency_therapist/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/doctor_screens_controller/doctor_home_screen_controller.dart';

class DoctorHomeScreen extends GetView<DoctorHomeScreenController> {
  const DoctorHomeScreen({super.key});
  final String tag=kDoctorHomeScreenController;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Obx(

                          () => RichText(
                        text: TextSpan(
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                            fontSize: Get.width * 0.055,
                            color: AppColors.primaryBlue,
                          ),
                          children: [
                            const TextSpan(text: "Hello,"),
                            TextSpan(
                              text: "\n${controller.doctorModel.value.firstName}",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                fontSize: Get.width * 0.060,
                                color: AppColors.textColor,
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),

                    PopupMenuButton(
                      onSelected: (value) {
                        if (value == 'Account') {
                          Get.toNamed(kDoctorProfileScreen);
                        }
                      },
                      itemBuilder: (context) => [

                        const PopupMenuItem(
                          value: 'Account',
                          child: ListTile(
                            leading: Icon(Icons.person),
                            title: Text("Account"),
                          ),
                        ),
                      ],
                      child: Obx(
                            () => CircleAvatar(
                            radius: 25,
                            backgroundImage: controller
                                .doctorModel.value.image !=
                                ''
                                ? CachedNetworkImageProvider(
                                controller.doctorModel.value.image)
                                : const AssetImage('assets/images/person.png')
                            as ImageProvider),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Container(
                    width: Get.width,
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    decoration: BoxDecoration(
                      color: AppColors.secondaryBlue,
                      borderRadius: BorderRadius.circular(30),
                    ),
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

                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 25, left: 5),
                                child: Text(
                                  "Learn Slow and\nEasy Speech",
                                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                    fontSize: Get.width * 0.052,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6, left: 5),
                                child: Text(
                                  "The most common technique\nto counter stuttering",
                                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                    fontSize: Get.width * 0.029,
                                    color: AppColors.descriptionColor,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 45, top: 5),
                                child: TextButton(
                                  onPressed: () {
                                    Get.toNamed(kSpeechExercisesScreen);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryBlue,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
                                    child: Center(
                                      child: Text(
                                        "View",
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                          fontSize: Get.width * 0.035,
                                          color: AppColors.whiteColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Features",
                        style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: Get.width * 0.045,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      cardWidget(
                        context: context,
                        title: "Booked Appointments",
                        image: customizedProgramsIcon,
                        routeName: kDoctorBookedAppointmentsScreen,
                      ),
                      const SizedBox(width: 20),
                      cardWidget(
                        context: context,
                        title: "Availability Scheduling",
                        image: speechExercisesIcon,
                        routeName: kDoctorSchedulingScreen,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      cardWidget(
                        context: context,
                        title: "View\nExercises",
                        image: progressTrackingIcon,
                        routeName: kProgressTrackingScreen,
                      ),
                      const SizedBox(width: 20),
                      cardWidget(
                        context: context,
                        title: "Other\nConsultants",
                        image: consultingIcon,
                        routeName: kConsultTherapistScreen,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget cardWidget({required BuildContext context, required String title, required String image, required String routeName}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Get.toNamed(routeName);
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.secondaryBlue,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.5, vertical: 10),
            child: Column(
              children: [
                Image(
                  image: AssetImage(image),
                  width: Get.width * 0.16,
                  height: Get.height * 0.090,
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: Get.width * 0.035,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
