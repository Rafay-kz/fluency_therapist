
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 25, left: 25, top: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
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
                    padding:
                        const EdgeInsets.only(top: 10, right: 38, left: 38),
                    child: Center(
                      child: Image(
                        image: const AssetImage(logoIcon),
                        height: screenHeight * 0.075,
                        width: screenWidth * 0.42,
                      ),
                    ),
                  ),
                  Obx(
                    () => CircleAvatar(
                      radius: 25,
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
                padding: const EdgeInsets.only(top: 15),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Booked Appointments',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontSize: screenWidth * 0.040,
                          color: AppColors.textColor,
                        ),
                  ),
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
                              callId: bookedSlot.callId, );
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
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Container(
        width: screenWidth * 0.9,
        height: MediaQuery.of(context).size.height * 0.23,
        decoration: BoxDecoration(
          color: AppColors.secondaryBlue,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 30, bottom: 10, left: 10, right: 0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: screenWidth * 0.13,
                    backgroundImage: doctor.image.isNotEmpty
                        ? CachedNetworkImageProvider(doctor.image)
                        : const AssetImage('assets/images/person.png')
                            as ImageProvider,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 30, top: 20),
                  child: Row(
                    children: [
                      Text(
                        'Dr. ${doctor.firstName}',
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  fontSize: screenWidth * 0.035,
                                  color: AppColors.textColor,
                                ),
                      ),
                      if (bookedSlot.date.isBefore(controller.now))
                        GestureDetector(
                          onTap: () {
                                controller.deleteAppointmentsForUser();
                          },
                          child: Icon(
                            Icons.delete,
                            color: AppColors.descriptionColor,
                            size: screenWidth * 0.05,
                          ),
                        )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2, left: 8),
                  child: Row(
                    children: [
                      Text(
                        doctor.specialization,
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: screenWidth * 0.032,
                                  color: AppColors.descriptionColor,
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
                        'Date: ${controller.formatDate(bookedSlot.date)}',
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: screenWidth * 0.032,
                                  color: AppColors.descriptionColor,
                                ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  // TIME SLOT INFORMATION
                  padding: const EdgeInsets.only(top: 2, left: 8),
                  child: Row(
                    children: [
                      Text(
                        'Start Time: ${bookedSlot.startTime.format(context)}',
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: screenWidth * 0.032,
                                  color: AppColors.descriptionColor,
                                ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  // TIME SLOT INFORMATION
                  padding: const EdgeInsets.only(top: 2, left: 8),
                  child: Row(
                    children: [
                      Text(
                        'End Time: ${bookedSlot.endTime.format(context)}',
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontSize: screenWidth * 0.032,
                                  color: AppColors.descriptionColor,
                                ),
                      ),
                    ],
                  ),
                ),
                    TextButton(
                    onPressed: controller.isButtonEnabled(bookedSlot)
                    ? () {
                    controller.callOptions(bookedSlot.callId);

                    // Send notification to the doctor if device token is available

                    }

                      : null,
                  child: Container(
                    width: screenWidth * 0.27,
                    height: MediaQuery.of(context).size.height * 0.046,
                    decoration: BoxDecoration(
                      color: controller.isButtonEnabled(bookedSlot)
                          ? AppColors.primaryBlue
                          : AppColors.descriptionColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        "Start",
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontSize: screenWidth * 0.035,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),



              ],
            )
          ],
        ),
      ),
    );
  }
}
