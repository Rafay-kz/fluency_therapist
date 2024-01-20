import 'package:fluency_therapist/utils/utills.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../controller/user_screens_controller/home_screens_controller/appointment_booking_screen_controller.dart';
import '../../../custom widgets/button.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart'; // Import your app constants

class AppointmentBookingScreen
    extends GetView<AppointmentBookingScreenController> {
  const AppointmentBookingScreen({Key? key}) : super(key: key);

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
                          height: screenHeight * 0.070,
                        ),
                      ),
                    ),
                    Obx(
                      () => CircleAvatar(
                        radius: screenWidth * 0.057,
                        backgroundImage: () {
                          // Check if userModel is empty, indicating doctorModel is active
                          if (controller.userModel.value.id.isEmpty) {
                            return controller.currentDoctorModel.value.image.isNotEmpty
                                ? CachedNetworkImageProvider(controller.currentDoctorModel.value.image)
                                : const AssetImage('assets/images/person.png') as ImageProvider;
                          } else {
                            // userModel is present, indicating a non-doctor user
                            return controller.userModel.value.image.isNotEmpty
                                ? CachedNetworkImageProvider(controller.userModel.value.image)
                                : const AssetImage('assets/images/person.png') as ImageProvider;
                          }
                        }(),
                      ),

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
                    labelColor: AppColors.primaryBlue,
                    unselectedLabelColor: Colors.grey,
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
                      _doctorAppointments(0, context, controller),
                      _doctorAppointments(1, context, controller),
                      _doctorAppointments(2, context, controller),
                      _doctorAppointments(3, context, controller),
                      _doctorAppointments(4, context, controller),
                      _doctorAppointments(5, context, controller),
                      _doctorAppointments(6, context, controller),
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

  Widget _doctorAppointments(int tabIndex, BuildContext context,
      AppointmentBookingScreenController controller) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: Get.height * 0.88 * 0.03, left: Get.width * 0.88 * 0.013),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Book Appointment",
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: Get.width * 0.88 * 0.045),
              ),
            ],
          ),
        ),
        SizedBox(
          height: Get.height * 0.88 * 0.015,
        ),
        Expanded(
          child: Obx(() {
            if (controller.isInitialized.value) {
              return ListView.builder(
                  itemCount: controller.timeSlotsMap[tabIndex]?.length,
                  itemBuilder: (context, index) {
                    final slot = controller.timeSlotsMap[tabIndex]?[index];
                    debugPrint(
                        'Slot $index - isAvailable: ${slot!.isAvailable}');
                    final bool isSlotAvailable = slot.isAvailable && !controller.isDateTimeInPast(slot.date, slot.endTime);
// Add this line
                    return Padding(
                      padding:  EdgeInsets.symmetric(vertical: Get.height * 0.88 * 0.015),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSlotAvailable
                              ? AppColors.secondaryBlue
                              : AppColors.textfieldColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(Get.width * 0.88 * 0.025),
                          child: Column(
                            children: [
                              ListTile(
                                leading: isSlotAvailable
                                    ? Obx(
                                        () => Radio(
                                          value: index,
                                          groupValue: controller
                                              .selectedSlotIndices[tabIndex]
                                              .value,
                                          onChanged: (value) {
                                            if (isSlotAvailable) {
                                              controller.setSelectedSlotIndex(tabIndex, value!);
                                            }
                                          },
                                          activeColor: Colors.green,
                                          fillColor: MaterialStateProperty.all(
                                            AppColors.primaryBlue,
                                          ),
                                        ),
                                      )
                                    : null,
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Date: ${controller.formatDate(slot!.date)}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                            fontSize: Get.width * 0.88 * 0.032,
                                            color: isSlotAvailable
                                                ? AppColors.pastelBlack
                                                : AppColors.descriptionColor,
                                          ),
                                    ),
                                    Text(
                                      'Start Time: ${slot.startTime.format(context)}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                            fontSize: Get.width * 0.88 * 0.032,
                                            color: isSlotAvailable
                                                ? AppColors.pastelBlack
                                                : AppColors.descriptionColor,
                                          ),
                                    ),
                                    Text(
                                      'End Time: ${slot.endTime.format(context)}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                            fontSize: Get.width * 0.88 * 0.032,
                                            color: isSlotAvailable
                                                ? AppColors.pastelBlack
                                                : AppColors.descriptionColor,
                                          ),
                                    ),
                                  ],
                                ),
                                // Hide the delete icon if radio button is not selected
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(), // Loading indicator
              );
            }
          }),
        ),
        Padding(
          padding:  EdgeInsets.only(bottom:Get.height*0.88*0.045),
          child: Obx(() {
            if (controller.userModel.value == null ||
                controller.userModel.value.id.isEmpty) {
              return const SizedBox(); // Return an empty widget when userModel is empty or null
            } else {
              return Button(
                onPressed: () {
                  Utils utils = Utils();
                  if (controller.selectedSlotIndices[tabIndex].value != -1) {
                    controller.bookAppointment(tabIndex);
                    Get.toNamed(kPaymentScreen);
                  } else {
                    utils.toastMessage("Please select a slot");
                  }
                },
                text: "Book Appointment",
              );
            }
          }),
        )
      ],
    );
  }
}
