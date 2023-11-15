import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluency_therapist/screens/doctor_module/doctor_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/doctor_screens_controller/doctor_edit_profile_screen_controller.dart';
import '../../custom widgets/time_picker.dart';
import '../../utils/app_colors.dart';
import '../../custom widgets/button.dart';

class DoctorEditProfileScreen extends GetView<DoctorEditProfileScreenController> {
  DoctorEditProfileScreen({Key? key}) : super(key: key);

  final FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    print(   "\n Dr.${controller.doctorModel.value.firstName}");
    final screenWidth = MediaQuery.of(context).size.width;
    TimeOfDay? startTime;
    TimeOfDay? endTime;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                       Get.to(DoctorHomeScreen ());
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: screenWidth * 0.10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Obx(() =>
                   Column(
                    children: [
                      Center(
                        child:CircleAvatar(
                            radius: screenWidth * 0.15,
                            backgroundImage: controller.doctorModel.value.image!=''
                                ? CachedNetworkImageProvider(
                                controller.doctorModel.value.image
                            ):controller.doctorModel.value.image==''&&controller.imagePath.isEmpty?const AssetImage('assets/images/person.png'):controller.imagePath.isNotEmpty
                                ? FileImage(
                                File(controller.imagePath.toString())) as ImageProvider
                                : null),
                      ),
                      TextButton(
                          onPressed: () {
                            controller.imagePickerOption();
                          },
                          child: const Text("Change Photo"))
                    ],
                  ),
                ),
                Obx(()=>Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 15),
                        child: Text(
                          "\n Dr.${controller.doctorModel.value.firstName}",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                            fontSize: screenWidth * 0.050,
                            color: AppColors.textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Text(
                    'Username',
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.start,
                  ),
                ),
                Obx(()=>Center(
                  child: SizedBox(
                    width: screenWidth * 0.9,
                    child: TextFormField(
                      controller: controller.nameTEController.value,
                      style: TextStyle(color: AppColors.textColor),
                      decoration: InputDecoration(
                        fillColor: AppColors.textfieldColor,
                        filled: true,

                        hintStyle: Theme.of(context).textTheme.titleMedium,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(
                          Icons.perm_identity_rounded,
                          color: AppColors.textHintColor,
                        ),
                      ),
                    ),
                  ),
                ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    'Email',
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.start,
                  ),
                ),
                Obx(()=>Center(
                  child: SizedBox(
                    width: screenWidth * 0.9,
                    child: TextFormField(
                      readOnly: true,
                      controller: controller.emailTEController.value,
                      style: TextStyle(color: AppColors.textColor),
                      decoration: InputDecoration(
                        fillColor: AppColors.textfieldColor,
                        filled: true,

                        hintStyle: Theme.of(context).textTheme.titleMedium,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: AppColors.textHintColor,
                        ),
                      ),
                    ),
                  ),
                ),
                ),
                const SizedBox(
                  height: 10,
                ),


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Speciality',
                      style: Theme.of(context).textTheme.headlineSmall),
                ),
                const SizedBox(
                  height: 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(()=>Center(
                    child: SizedBox(
                      width: screenWidth * 0.89,
                      child: TextFormField(
                        controller: controller.specialityTEController.value,
                        onSaved: (value) {
                          controller.speciality = value!;
                        },
                        validator: (value) {
                          return controller.validateSpeciality(value!);
                        },
                        style: TextStyle(color: AppColors.textColor),
                        decoration: InputDecoration(
                          fillColor: AppColors.textfieldColor,
                          filled: true,
                          contentPadding: const EdgeInsets.only(left: 15),
                          hintText: 'Enter your Speciality',
                          hintStyle:
                          Theme.of(context).textTheme.titleMedium,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                  ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Bio',
                      style: Theme.of(context).textTheme.headlineSmall),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(()=>Center(
                    child: SizedBox(
                      width: screenWidth * 0.89,
                      child: TextFormField(
                        controller: controller.bioTEController.value,
                        maxLines: 4,
                        // Limiting the user to 3 lines for the introduction
                        onSaved: (value) {
                          controller.bio = value!;
                        },
                        style: TextStyle(color: AppColors.textColor),
                        decoration: InputDecoration(
                          fillColor: AppColors.textfieldColor,
                          filled: true,
                          contentPadding: const EdgeInsets.all(15),
                          hintText: 'Enter your bio',
                          hintStyle:
                          Theme.of(context).textTheme.titleMedium,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ),
                ),
                Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Availability Days',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.center,
                        // Aligns the children to the center vertically
                        children: [
                          DropdownButton<String>(
                            value: controller.startDay
                                .value.isNotEmpty
                                ? controller
                                .startDay.value
                                : null,
                            onChanged: (newValue) {
                              controller.setStartDay(
                                  newValue!);
                            },
                            items: <String>[
                              'Sunday',
                              'Monday',
                              'Tuesday',
                              'Wednesday',
                              'Thursday',
                              'Friday',
                              'Saturday',
                            ].map<
                                DropdownMenuItem<
                                    String>>(
                                    (String value) {
                                  return DropdownMenuItem<
                                      String>(
                                    value: value,
                                    child: Text(value,
                                        style: TextStyle(
                                            color: AppColors
                                                .textColor)),
                                  );
                                }).toList(),
                          ),
                          Padding(
                            padding: const EdgeInsets
                                .symmetric(
                                horizontal: 15.0),
                            child: Text('to',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                    color: AppColors
                                        .textColor,
                                    fontSize: 16)),
                          ),
                          DropdownButton<String>(
                            value: controller.endDay
                                .value.isNotEmpty
                                ? controller
                                .endDay.value
                                : null,
                            onChanged: (newValue) {
                              controller.setEndDay(
                                  newValue!);
                            },
                            items: <String>[
                              'Sunday',
                              'Monday',
                              'Tuesday',
                              'Wednesday',
                              'Thursday',
                              'Friday',
                              'Saturday',
                            ].map<
                                DropdownMenuItem<
                                    String>>(
                                    (String value) {
                                  return DropdownMenuItem<
                                      String>(
                                    value: value,
                                    child: Text(value,
                                        style: TextStyle(
                                            color: AppColors
                                                .textColor)),
                                  );
                                }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Availability',
                      style: Theme.of(context).textTheme.headlineSmall),
                ),
                const SizedBox(height: 8),
                TimePicker(onRangeCompleted: (range) {
                  startTime = range?.start;
                  endTime = range?.end;
                  if (startTime != null && endTime != null) {
                    controller.availabilityStart = startTime!;
                    controller.availabilityEnd = endTime!;
                  } else {
                    return;
                  }
                }),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Location',
                      style: Theme.of(context).textTheme.headlineSmall),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:Obx(()=> Center(
                    child: SizedBox(
                      width: screenWidth * 0.89,
                      child: TextFormField(
                        controller: controller.locationTEController.value,
                        onSaved: (value) {
                          controller.fullName = value!;
                        },
                        validator: (value) {
                          return controller.validateLocation(value!);
                        },
                        style: TextStyle(color: AppColors.textColor),
                        decoration: InputDecoration(
                          fillColor: AppColors.textfieldColor,
                          filled: true,
                          contentPadding: const EdgeInsets.only(left: 15),
                          hintText: 'Add Location or virtual',
                          hintStyle:
                          Theme.of(context).textTheme.titleMedium,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                  ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Button(onPressed: () {controller.editProfile();}, text: "Update"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
