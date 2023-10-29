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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
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
                      padding: const EdgeInsets.only(top: 10),
                      child: Center(
                        child: Image(
                          image: const AssetImage(logoIcon),
                          width: screenWidth * 0.42,
                          height: screenHeight * 0.075,
                        ),
                      ),
                    ),
                    Obx(() => CircleAvatar(
                          radius: 25,
                          backgroundImage:
                              controller.userModel.value.image != ''
                                  ? CachedNetworkImageProvider(
                                      controller.userModel.value.image,
                                    )
                                  : const AssetImage('assets/images/person.png')
                                      as ImageProvider,
                        )),
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
                    labelColor: AppColors.primaryBlue,
                    unselectedLabelColor: Colors.grey,
                    labelStyle: Theme.of(context).textTheme.headlineSmall,
                    unselectedLabelStyle:
                        Theme.of(context).textTheme.headlineSmall,
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
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Book An Appointment',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: 20),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: Obx(() {
            if (controller.isInitialized.value) {
              return ListView.builder(
                  itemCount: controller.timeSlotsMap[tabIndex]?.length,
                  itemBuilder: (context, index) {
                    final slot = controller.timeSlotsMap[tabIndex]?[index];
                    debugPrint('Slot $index - isAvailable: ${slot!.isAvailable}'); // Add this line
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: slot!.isAvailable ? AppColors.secondaryBlue : AppColors.textfieldColor,
                          borderRadius: BorderRadius.circular(15),

                        ),

                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              ListTile(
                                leading: slot.isAvailable
                                    ? Obx(
                                      () => Radio(
                                    value: index,
                                    groupValue: controller
                                        .selectedSlotIndices[tabIndex].value,
                                    onChanged: (value) {
                                      controller.setSelectedSlotIndex(tabIndex, value!);
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
                                        'Date: ${controller.formatDate(slot!.date)}'),
                                    Text(
                                        'Start Time: ${slot.startTime.format(context)}'),
                                    Text(
                                        'End Time: ${slot.endTime.format(context)}'),

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
          padding: const EdgeInsets.only(bottom: 40),
          child: Button(
            onPressed: () {
              Utils utils = Utils();
              if (controller.selectedSlotIndices[tabIndex].value != -1) {
                controller.bookAppointment(tabIndex);
                utils.toastMessage2("Appointment Booked!");
                Get.toNamed(kBookedAppointmentScreen);
              } else {
                utils.toastMessage("Please select a slot");
              }
            },
            text: "Book Appointment",
          ),
        )
      ],
    );
  }
}
