import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluency_therapist/model/booked_slot_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/user_screens_controller/home_screens_controller/booked_appointment_screen_controller.dart';

import '../../../model/doctor_model.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';

class BookedAppointmentScreen
    extends GetView<BookedAppointmentScreenController> {
  const BookedAppointmentScreen({Key? key}) : super(key: key);

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
                      "Booked Appointments",
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
                  return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ListView.builder(
                        itemCount: controller.bookedSlots.length,
                        itemBuilder: (BuildContext context, int index) {
                          final bookedSlot = controller.bookedSlots[index];
                          final doctor = controller.doctorUsers.firstWhere(
                            (doctor) => doctor.id == bookedSlot.doctorId,
                            orElse: () => DoctorModel.empty(),
                          );

                          return AppointmentCard(
                            doctor: doctor,
                            bookedSlot: bookedSlot,
                            controller: controller,
                            callId: bookedSlot.callId,
                          );
                        }),
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

class AppointmentCard extends StatelessWidget {
  final DoctorModel doctor;
  final BookedSlot bookedSlot;
  final int callId;

  final BookedAppointmentScreenController controller;

  const AppointmentCard(
      {super.key,
        required this.doctor,
        required this.bookedSlot,
        required this.callId,
        required this.controller});

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
          borderRadius: BorderRadius.circular(35),
        ),
        child: Padding(
          padding: EdgeInsets.only(
              top: screenHeight * 0.012, bottom: screenHeight * 0.012),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.035),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: screenWidth * 0.15,
                      backgroundImage: doctor.image.isNotEmpty
                          ? CachedNetworkImageProvider(doctor.image)
                          : const AssetImage('assets/images/person.png')
                      as ImageProvider,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.030),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Dr. ${doctor.firstName} ${doctor.lastName}',
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                              fontSize: screenWidth * 0.035,
                              color: AppColors.textColor,
                            ),
                          ),
                          if (controller.isAppointmentTimePassed(bookedSlot, controller.now))
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: GestureDetector(
                                onTap: () {
                                  controller.deleteAppointment(controller.userModel.value.id, bookedSlot.callId);
                                },
                                child: Icon(
                                  Icons.delete,
                                  color: AppColors.descriptionColor,
                                  size: screenWidth * 0.05,
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                    Text(
                      doctor.specialization,
                      style:
                      Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontSize: screenWidth * 0.032,
                        color: AppColors.descriptionColor,
                      ),
                    ),
                    SizedBox(height: screenHeight*0.015),
                    Row(
                      children: [
                        Text(
                          'Date: ${controller.formatDate(bookedSlot.date)}',
                          style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                            fontSize: screenWidth * 0.032,
                            color: AppColors.pastelBlack,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${bookedSlot.startTime.format(context)} to ${bookedSlot.endTime.format(context)}',
                      style:
                      Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontSize: screenWidth * 0.032,
                        color:AppColors.pastelBlack,
                      ),
                    ),

                    Align(
                      alignment: Alignment.bottomLeft,
                      child: TextButton(
                        onPressed: controller.isButtonEnabled(bookedSlot)
                            ? () {
                          controller.callOptions(bookedSlot.callId);
                        }
                            : null,
                        style: TextButton.styleFrom(
                          backgroundColor: controller.isButtonEnabled(bookedSlot)
                              ? AppColors.primaryBlue
                              : AppColors.descriptionColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.010,
                          ),
                          // Set a smaller minimum size for the button
                          minimumSize: Size(screenWidth * 0.1, screenWidth * 0.0015),

                        ),

                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.032, vertical: screenWidth*0.018),
                          child: Text(
                            "Start", textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                              fontSize: screenWidth * 0.032,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}