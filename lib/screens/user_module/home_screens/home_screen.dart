import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluency_therapist/utils/app_colors.dart';
import 'package:fluency_therapist/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/user_screens_controller/home_screens_controller/home_screen_controller.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  final String tag = kHomeScreenController;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width * 0.88;
    final double screenHeight = MediaQuery.of(context).size.height * 0.88;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.05, vertical: screenHeight*0.02),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => RichText(
                        text: TextSpan(
                          style:
                              Theme.of(context).textTheme.headlineSmall!.copyWith(
                                    fontSize: screenWidth* 0.060,
                                    color: AppColors.primaryBlue,
                                  ),
                          children: [
                            const TextSpan(text: "Hello,"),
                            TextSpan(
                              text: "\n${controller.userModel.value.firstName}",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                    fontSize: screenWidth * 0.066,
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
                          Get.toNamed(kUserProfileScreen);
                        }
                        if (value == 'Logout') {
                           controller.logout();
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
                        const PopupMenuItem(
                          value: 'Logout',
                            child: ListTile(
                              leading: Icon(Icons.logout),
                              title: Text("Logout")))

                      ],
                      child: Obx(
                        () => CircleAvatar(
                          radius: screenWidth*0.072,
                          backgroundImage: controller.userModel.value.image != ''
                              ? CachedNetworkImageProvider(
                                  controller.userModel.value.image)
                              : const AssetImage('assets/images/person.png')
                                  as ImageProvider,
                        ),
                      ),
                    ),
                  ],
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 30),
                //   child: Center(
                //     child: TextField(
                //       decoration: InputDecoration(
                //         fillColor: AppColors.textfieldColor,
                //         filled: true,
                //         hintText: 'Search a doctor...',
                //         hintStyle:
                //             Theme.of(context).textTheme.headlineSmall!.copyWith(
                //                   fontSize: screenWidth * 0.042,
                //                   color: AppColors.textHintColor,
                //                 ),
                //         border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(30),
                //           borderSide: BorderSide.none,
                //         ),
                //         prefixIcon: GestureDetector(
                //           onTap: () {
                //             Get.toNamed(kSearchScreen);
                //           },
                //           child: Padding(
                //             padding:  EdgeInsets.only(left: screenWidth*0.03, right: screenWidth*0.02),
                //             child: Icon(
                //               Icons.search_sharp,
                //               size: screenWidth * 0.080,
                //               color: AppColors.textHintColor,
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(height: screenHeight*0.038),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.secondaryBlue,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(vertical: screenHeight*0.035, horizontal: screenWidth*0.05),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                image: const AssetImage(parrotImage),
                                width: screenWidth * 0.31,
                                height: screenHeight * 0.21,
                              ),
                            ],
                          ),
                           SizedBox(width: screenWidth*0.028), // Add some space between the image and text
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(top: screenHeight*0.032, left: screenWidth*0.012),
                                child: Text(
                                  "Learn Slow and\nEasy Speech",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(fontSize: Get.width * 0.055),
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(top: screenHeight*0.010, left: screenWidth*0.012),
                                child: Text(
                                  "The most common technique\nto counter stuttering",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                    fontSize: Get.width * 0.029,
                                    color: AppColors.descriptionColor,
                                  ),
                                ),
                              ),
                              SizedBox(height: screenHeight*0.012),
                              TextButton(
                                onPressed: () {
                                  Get.toNamed(kSpeechExercisesScreen);
                                },
                                child: Container(
                                  height: screenHeight*0.046,
                                  width: screenWidth*0.19,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryBlue,
                                    borderRadius: BorderRadius.circular(30),
                                  ),


                                  child: Center(
                                    child: Text(
                                      "View",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                        fontSize: screenWidth * 0.032,
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
                  ),
                ),
                      Padding(
                        padding:  EdgeInsets.only(top: screenHeight*0.025, bottom: screenHeight*0.025),
                        child: Text(
                          "Services",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                            fontSize: screenWidth * 0.050,
                            color: AppColors.textColor,
                              ),
                        ),
                      ),

                Row(
                        children: [
                          cardWidget(
                            context: context,
                            title: "Consult\nTherapist",
                            image: consultingIcon,

                            routeName: kConsultTherapistScreen,
                          ),

                          SizedBox(width: screenWidth*0.06,),
                          cardWidget(
                            context: context,
                            title: "Progress\nTracking",
                            image: progressTrackingIcon,

                            routeName: kProgressTrackingScreen,
                          ),
                        ],
                      ),
                  SizedBox(height: screenHeight*0.035,),

                Row(
                        children: [
                          cardWidget(
                              context: context,
                              title: "Booked\nAppointments",
                              image: bookedAppointmentIcon,

                              routeName: kBookedAppointmentScreen),
                          SizedBox(width: screenWidth*0.06,),
                          cardWidget(
                            context: context,
                            title: "Account\nSettings",
                            image: customizedProgramsIcon,

                            routeName: kPaymentScreen,
                          ),


                        ],
                      ),
                    ],
                  ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget cardWidget(
      {required BuildContext context,
      required String title,
      required String image,
      required String routeName,
      }) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Get.toNamed(routeName);
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.secondaryBlue,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: Get.width*0.88*0.02, vertical: Get.height*0.88*0.042),
            child: Column(
              children: [
                Image(
                  image: AssetImage(image),
                  width: Get.width * 0.88 *0.19,
                  height: Get.height *0.88 * 0.098,

                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: Get.width *0.88* 0.038,
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
