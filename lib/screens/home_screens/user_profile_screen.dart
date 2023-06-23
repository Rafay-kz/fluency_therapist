import 'package:fluency_therapist/screens/home_screens/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_screens_controller/user_profile_screen_controlller.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';
import '../../utils/widgets/button.dart';

class UserProfileScreen extends GetView<UserProfileScreenController> {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: screenWidth * 0.10,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: CircleAvatar(
                radius: screenWidth * 0.20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 15),
              child: Text(
                "Dr M Ali Nizamani",
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: screenWidth * 0.050,
                      color: AppColors.textColor,
                    ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Image(
                    image: const AssetImage(editlogo),
                    width: screenWidth * 0.10,
                    height: screenHeight * 0.05,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 85),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(const EditProfileScreen());
                        },
                        child: Text(
                          "Edit Profile",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                fontSize: screenWidth * 0.040,
                                color: AppColors.textColor,
                              ),
                        ),
                      ),
                    ),
                    Text(
                      'Name, photo, email etc. ',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: SizedBox(
                    width: 500,
                    child: Divider(
                      color: AppColors.descriptionColor,
                      thickness: 1,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10, left: 5),
                  child: Image(
                    image: const AssetImage(progresslogo),
                    width: screenWidth * 0.05,
                    height: screenHeight * 0.05,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 85, left: 20),
                      child: Text(
                        "Progress Tracking",
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  fontSize: screenWidth * 0.040,
                                  color: AppColors.textColor,
                                ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        'Exercise progress, tracking',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: SizedBox(
                    width: 500,
                    child: Divider(
                      color: AppColors.descriptionColor,
                      thickness: 1,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Image(
                    image: const AssetImage(billinglogo),
                    width: screenWidth * 0.10,
                    height: screenHeight * 0.05,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 85),
                      child: Text(
                        "Billing Details",
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  fontSize: screenWidth * 0.040,
                                  color: AppColors.textColor,
                                ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        'Payment and billing details ',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: SizedBox(
                    width: 500,
                    child: Divider(
                      color: AppColors.descriptionColor,
                      thickness: 1,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Image(
                    image: const AssetImage(privacylogo),
                    width: screenWidth * 0.10,
                    height: screenHeight * 0.05,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 85),
                      child: Text(
                        "Privacy Policy",
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  fontSize: screenWidth * 0.040,
                                  color: AppColors.textColor,
                                ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 50,
                      ),
                      child: Text(
                        'Privacy and policies ',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: SizedBox(
                    width: 500,
                    child: Divider(
                      color: AppColors.descriptionColor,
                      thickness: 1,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Button(onPressed: () {}, text: "Logout"),
            ),
          ]),
        ),
      ),
    );
  }
}
