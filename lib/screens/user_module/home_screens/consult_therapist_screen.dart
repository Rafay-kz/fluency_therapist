import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/user_screens_controller/home_screens_controller/consult_therapist_screen_controller.dart';
import '../../../model/doctor_model.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';

class ConsultTherapistScreen extends GetView<ConsultTherapistScreenController> {
  const ConsultTherapistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width * 0.88;
    final screenHeight = MediaQuery.of(context).size.height * 0.88;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Padding(
                    padding: EdgeInsets.only(top: screenWidth * 0.02),
                    child: Center(
                      child: Image(
                        image: const AssetImage(logoIcon),
                        width: screenWidth * 0.42,
                        height: screenHeight * 0.070,
                      ),
                    ),
                  ),
                  Obx(
                    () => CircleAvatar(
                      radius: screenWidth * 0.057,
                      backgroundImage: controller.doctorModel.value.image != ''
                          ? CachedNetworkImageProvider(
                              controller.doctorModel.value.image)
                          : (controller.userModel.value.image != ''
                              ? CachedNetworkImageProvider(
                                  controller.userModel.value.image)
                              : const AssetImage('assets/images/person.png')
                                  as ImageProvider),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.03,
                    bottom: screenHeight * 0.02,
                    left: screenWidth * 0.013),
                child: Row(
                  children: [
                    Text(
                      "Consult Therapists",
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: screenWidth * 0.045),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    itemCount: controller.doctorUsers.length,
                    itemBuilder: (BuildContext context, int index) {
                      final doctor = controller.doctorUsers[index];

                      return DoctorUserCard(
                        doctor: doctor,
                        controller: controller,
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DoctorUserCard extends StatelessWidget {
  final DoctorModel doctor;
  final ConsultTherapistScreenController controller;

  const DoctorUserCard({
    super.key,
    required this.doctor,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width * 0.88;
    final screenHeight = MediaQuery.of(context).size.height * 0.88;

    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight * 0.03),
      child: Container(
        width: screenWidth,
        decoration: BoxDecoration(
          color: AppColors.secondaryBlue,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: EdgeInsets.only(
              top: screenHeight * 0.012, bottom: screenHeight * 0.012),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.035),
                child: CircleAvatar(
                  radius: screenWidth * 0.14,
                  backgroundImage: doctor.image.isNotEmpty
                      ? CachedNetworkImageProvider(doctor.image)
                      : const AssetImage('assets/images/person.png')
                          as ImageProvider,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.030),
                      child: Text(
                        'Dr. ${doctor.firstName} ${doctor.lastName}',
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  fontSize: screenWidth * 0.037,
                                  color: AppColors.textColor,
                                ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: screenWidth * 0.015),
                      child: Text(
                        doctor.specialization,
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: screenWidth * 0.034,
                                  color: AppColors.descriptionColor,
                                ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: TextButton(
                        onPressed: () {
                          Get.toNamed(kConsultantProfileScreen,
                              arguments: doctor);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.primaryBlue,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.010,
                          ),
                          // Set a smaller minimum size for the button
                          minimumSize:
                              Size(screenWidth * 0.1, screenWidth * 0.0015),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.018, vertical: screenWidth*0.022),
                          child: Text(
                            "View Profile",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontSize: screenWidth * 0.030,
                                  color: AppColors.whiteColor,
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
    );
  }
}
