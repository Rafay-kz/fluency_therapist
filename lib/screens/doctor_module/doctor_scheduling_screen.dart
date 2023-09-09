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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 25, left: 25, top: 10),
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
                        size: screenWidth * 0.10,
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(top: 10, right: 38, left: 38),
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
                          radius: 25,
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
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                    ],
                    indicatorColor: AppColors.primaryBlue,
                    // Color of the indicator line
                    labelColor: AppColors.primaryBlue,
                    // Color of the selected tab label
                    unselectedLabelColor: Colors.grey,
                    // Color of unselected tab labels
                    labelStyle: Theme.of(context).textTheme.headlineSmall,
                    unselectedLabelStyle:
                    Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      _doctorScheduler(0, context, controller),
                      _doctorScheduler(1, context, controller),
                      _doctorScheduler(2 , context, controller),
                      _doctorScheduler(3, context, controller),
                      _doctorScheduler(4, context, controller),
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
Widget _doctorScheduler(int tabIndex, BuildContext context, DoctorSchedulingScreenController controller) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Text(
          'Set Consultation Time',
          style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
            child: const Text("Select Date"),
          ),
          const SizedBox(width: 20,),
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
            child: const Text("Select Start Time"),
          ),
          const SizedBox(width: 20,),
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
            child: const Text("Select End Time"),
          ),
        ],
      ),
      ElevatedButton(
        onPressed: () {
          if (controller.selectedStartTime.hour < controller.selectedEndTime.hour ||
              (controller.selectedStartTime.hour == controller.selectedEndTime.hour &&
                  controller.selectedStartTime.minute < controller.selectedEndTime.minute)) {
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
        child: const Text("Add Slot"),
      ),
      const SizedBox(height: 20,),
      Expanded(
        child: Obx(() {
          if (controller.isInitialized.value) {
            return ListView.builder(
              itemCount: controller.timeSlotsMap[tabIndex]?.length,
              itemBuilder: (context, index) {
                final slot = controller.timeSlotsMap[tabIndex]?[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Obx(() =>
                     Container(
                      decoration: BoxDecoration(
                        color: AppColors.textfieldColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Obx(() =>
                                 Radio(
                                  value: index,
                                  groupValue: controller.selectedSlotIndex.value,
                                  onChanged: (value) {
                                    controller.selectedSlotIndex.value = value!;
                                  },
                                  activeColor: Colors.green,
                                  fillColor: MaterialStateProperty.all(AppColors.primaryBlue),
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Date: ${controller.formatDate(slot!.date)}'),
                                  Text('Start Time: ${slot.startTime.format(context)}'),
                                  Text('End Time: ${slot.endTime.format(context)}'),
                                ],
                              ),
                              trailing: controller.selectedSlotIndex.value == index // Check if radio button is selected
                                  ? IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  controller.removeTimeSlot(tabIndex, index);
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
