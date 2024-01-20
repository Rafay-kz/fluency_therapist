import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluency_therapist/controller/doctor_screens_controller/doctor_scheduling_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';
import '../../model/timeslots_model.dart';

class DoctorSchedulingScreen extends GetView<DoctorSchedulingScreenController> {
  const DoctorSchedulingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width * 0.88;
    final screenHeight = MediaQuery.of(context).size.height * 0.88;

    return DefaultTabController(
      length: 7,
      child: Scaffold(
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
                          height: screenHeight * 0.075,
                        ),
                      ),
                    ),
                    Obx(
                      () => CircleAvatar(
                          radius: screenWidth * 0.057,
                          backgroundImage:
                              controller.doctorModel.value.image != ''
                                  ? CachedNetworkImageProvider(
                                      controller.doctorModel.value.image)
                                  : const AssetImage('assets/images/person.png')
                                      as ImageProvider),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.010),
                  child: TabBar(
                    isScrollable: true,
                    tabs: const [
                      Tab(
                        text: "Monday",
                      ),
                      Tab(
                        text: "Tuesday",
                      ),
                      Tab(
                        text: "Wednesday",
                      ),
                      Tab(
                        text: "Thursday",
                      ),
                      Tab(
                        text: "Friday",
                      ),
                      Tab(
                        text: "Saturday",
                      ),
                      Tab(
                        text: "Sunday",
                      ),
                    ],
                    indicatorColor: AppColors.primaryBlue,
                    // Color of the indicator line
                    labelColor: AppColors.primaryBlue,
                    // Color of the selected tab label
                    unselectedLabelColor: Colors.grey,
                    // Color of unselected tab labels
                    labelStyle: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontSize: screenWidth * 0.036),
                    unselectedLabelStyle: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontSize: screenWidth * 0.035),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      _doctorScheduler(0, context, controller),
                      _doctorScheduler(1, context, controller),
                      _doctorScheduler(2, context, controller),
                      _doctorScheduler(3, context, controller),
                      _doctorScheduler(4, context, controller),
                      _doctorScheduler(5, context, controller),
                      _doctorScheduler(6, context, controller),
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
}

Widget _doctorScheduler(int tabIndex, BuildContext context,
    DoctorSchedulingScreenController controller) {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.only(
            top: Get.height * 0.88 * 0.03, left: Get.width * 0.88 * 0.013),
        child: Text(
          'Set Consultation Time',
          style:
              Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20),
        ),
      ),
      SizedBox(
        height: Get.height * 0.88 * 0.015,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () async {
              controller.calculateDateValues(tabIndex);
              final pickedDate = await showDatePicker(
                context: context,
                initialDate: controller.selectedDate,
                firstDate: controller.initialDate,
                lastDate: controller.initialDate,
              );

              if (pickedDate != null) {
                controller.selectedDate = pickedDate;
              }
            },
            child: Text(
              "Select Date",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: Get.width * 0.88 * 0.036,
                  color: AppColors.primaryBlue),
            ),
          ),
          TextButton(
            onPressed: () async {
              final pickedTime = await showTimePicker(
                context: context,
                initialTime: controller.selectedStartTime,
              );

              if (pickedTime != null) {
                controller.selectedStartTime = pickedTime;
              }
            },
            child: Text(
              "Select Start Time",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: Get.width * 0.88 * 0.036,
                  color: AppColors.primaryBlue),
            ),
          ),
          TextButton(
            onPressed: () async {
              final pickedEndTime = await showTimePicker(
                context: context,
                initialTime: controller.selectedEndTime,
              );

              if (pickedEndTime != null) {
                controller.selectedEndTime = pickedEndTime;
              }
            },
            child: Text(
              "Select End Time",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: Get.width * 0.88 * 0.036,
                  color: AppColors.primaryBlue),
            ),
          ),
        ],
      ),
      SizedBox(
        height: 10,
      ),
      ElevatedButton(
        onPressed: () {
          if (controller.selectedStartTime.hour <
                  controller.selectedEndTime.hour ||
              (controller.selectedStartTime.hour ==
                      controller.selectedEndTime.hour &&
                  controller.selectedStartTime.minute <
                      controller.selectedEndTime.minute)) {
            final newSlot = TimeSlot(
              date: controller.selectedDate,
              startTime: controller.selectedStartTime,
              endTime: controller.selectedEndTime,
            );

            controller.addTimeSlot(tabIndex, newSlot);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Start time must be before end time.'),
              ),
            );
          }
        },
        child: Text(
          "Add Slot",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontSize: Get.width * 0.88 * 0.032, color: Colors.white),
        ),
      ),
      SizedBox(
        height: Get.height * 0.88 * 0.040,
      ),
      Expanded(
        child: Obx(() {
          if (controller.isInitialized.value) {
            return ListView.builder(
              itemCount: controller.timeSlotsMap[tabIndex]?.length,
              itemBuilder: (context, index) {
                final slot = controller.timeSlotsMap[tabIndex]?[index];
                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: Get.height * 0.88 * 0.015),
                  child: Obx(
                    () => Container(
                      decoration: BoxDecoration(
                        color: slot!.isAvailable
                            ? AppColors.secondaryBlue
                            : AppColors.textfieldColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(Get.width * 0.88 * 0.025),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Obx(
                                () => Radio(
                                  value: index,
                                  groupValue:
                                      controller.selectedSlotIndex.value,
                                  onChanged: (value) {
                                    controller.selectedSlotIndex.value = value!;
                                  },
                                  activeColor: Colors.green,
                                  fillColor: MaterialStateProperty.all(
                                      AppColors.primaryBlue),
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Date: ${slot?.date != null ? controller.formatDate(slot!.date) : ''}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                          fontSize: Get.width * 0.88 * 0.032,
                                          color: slot!.isAvailable
                                              ? AppColors.pastelBlack
                                              : AppColors.descriptionColor,
                                        ),
                                  ),
                                  Text(
                                    'Start Time: ${slot?.startTime != null ? slot?.startTime.format(context) : ''}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                          fontSize: Get.width * 0.88 * 0.032,
                                          color: slot!.isAvailable
                                              ? AppColors.pastelBlack
                                              : AppColors.descriptionColor,
                                        ),
                                  ),
                                  Text(
                                    'End Time: ${slot?.endTime != null ? slot?.endTime.format(context) : ''}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                          fontSize: Get.width * 0.88 * 0.032,
                                          color: slot!.isAvailable
                                              ? AppColors.pastelBlack
                                              : AppColors.descriptionColor,
                                        ),
                                  ),
                                ],
                              ),
                              trailing: controller.selectedSlotIndex.value ==
                                      index // Check if radio button is selected
                                  ? IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {
                                        controller.removeTimeSlot(
                                            tabIndex, index);
                                      },
                                    )
                                  : const SizedBox(), // Hide the delete icon if radio button is not selected
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            // Show a loading indicator while initializing
            return const Center(
              child: CircularProgressIndicator(), // Customize as needed
            );
          }
        }),
      ),
    ],
  );
}
