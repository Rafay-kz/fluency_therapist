import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_screens_controller/doctor_edit_profile_screen_controller.dart';
import '../../custom widgets/time_picker.dart';
import '../../utils/app_colors.dart';
import '../../custom widgets/button.dart';

class DoctorEditProfileScreen extends GetView<DoctorEditProfileScreenController> {
  DoctorEditProfileScreen({Key? key}) : super(key: key);

  final FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
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
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: screenWidth * 0.10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Obx(() {
                  return Column(
                    children: [
                      Center(
                        child: CircleAvatar(
                            radius: screenWidth * 0.15,
                            backgroundImage: controller.imagePath.isNotEmpty
                                ? FileImage(
                                File(controller.imagePath.toString()))
                                : null),
                      ),
                      TextButton(
                          onPressed: () {
                            controller.imagePickerOption();
                          },
                          child: const Text("Change Photo"))
                    ],
                  );
                }),
                Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 15),
                        child: Text(
                          "Dr M Ali Nizamani",
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
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Text(
                    'Username',
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.start,
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: screenWidth * 0.9,
                    child: TextFormField(
                      controller: controller.nameTEController,
                      decoration: InputDecoration(
                        fillColor: AppColors.textfieldColor,
                        filled: true,
                        hintText: 'Enter your name',
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
                Center(
                  child: SizedBox(
                    width: screenWidth * 0.9,
                    child: TextFormField(
                      controller: controller.emailTEController,
                      decoration: InputDecoration(
                        fillColor: AppColors.textfieldColor,
                        filled: true,
                        hintText: 'Enter your email',
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
                  child: Center(
                    child: SizedBox(
                      width: screenWidth * 0.89,
                      child: TextFormField(
                        controller: controller.specialityController,
                        onSaved: (value) {
                          controller.speciality = value!;
                        },
                        validator: (value) {
                          return controller.validateSpeciality(value!);
                        },
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Bio',
                      style: Theme.of(context).textTheme.headlineSmall),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: SizedBox(
                      width: screenWidth * 0.89,
                      child: TextFormField(
                        controller: controller.bioController,
                        maxLines: 4,
                        // Limiting the user to 3 lines for the introduction
                        onSaved: (value) {
                          controller.bio = value!;
                        },
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
                  child: Center(
                    child: SizedBox(
                      width: screenWidth * 0.89,
                      child: TextFormField(
                        controller: controller.locationController,
                        onSaved: (value) {
                          controller.fullName = value!;
                        },
                        validator: (value) {
                          return controller.validateLocation(value!);
                        },
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
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Button(onPressed: () {}, text: "Update"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
