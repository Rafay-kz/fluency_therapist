import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../custom widgets/button.dart';
import '../../../utils/app_colors.dart';
import '../../controller/doctor_screens_controller/doctor_profile_setup_screen_controller.dart';

class DoctorProfileSetUpScreen
    extends GetView<DoctorProfileSetUpScreenController> {
  DoctorProfileSetUpScreen({Key? key}) : super(key: key);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      Center(
                        child: CircleAvatar(
                            radius: screenWidth * 0.15,
                            backgroundImage: controller.doctorModel.value
                                .image !=
                                ''
                                ? CachedNetworkImageProvider(
                                controller.doctorModel.value.image)
                                : controller.doctorModel.value.image == '' &&
                                controller.imagePath.isEmpty
                                ? const AssetImage('assets/images/person.png')
                                : controller.imagePath.isNotEmpty
                                ? FileImage(File(
                                controller.imagePath.toString()))
                            as ImageProvider
                                : null),
                      ),
                      TextButton(
                          onPressed: () {
                            controller.imagePickerOption();
                          },
                          child: const Text("Change Photo"))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Specialization',
                        style: Theme
                            .of(context)
                            .textTheme
                            .headlineSmall),
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
                            hintText: 'Enter your Specialization',
                            hintStyle: Theme
                                .of(context)
                                .textTheme
                                .titleMedium,
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
                    child: Text('Location',
                        style: Theme
                            .of(context)
                            .textTheme
                            .headlineSmall),
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
                          controller: controller.locationTEController.value,
                          onSaved: (value) {
                            controller.location = value!;
                          },
                          validator: (value) {
                            return controller.validateLocation(value!);
                          },
                          style: TextStyle(color: AppColors.textColor),
                          decoration: InputDecoration(
                            fillColor: AppColors.textfieldColor,
                            filled: true,
                            contentPadding: const EdgeInsets.only(left: 15),
                            hintText: 'Enter your Location',
                            hintStyle: Theme
                                .of(context)
                                .textTheme
                                .titleMedium,
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
                        style: Theme
                            .of(context)
                            .textTheme
                            .headlineSmall),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: SizedBox(
                        width: screenWidth * 0.89,
                        child: TextFormField(
                          controller: controller.bioTEController.value,
                          maxLines: 4,
                          // Limiting the user to 3 lines for the introduction
                          onSaved: (value) {
                            controller.bio = value!;
                          },
                          validator: (value) {
                            return controller.validateBio(value!);
                          },
                          style: TextStyle(color: AppColors.textColor),
                          decoration: InputDecoration(
                            fillColor: AppColors.textfieldColor,
                            filled: true,
                            contentPadding: const EdgeInsets.all(15),
                            hintText: 'Enter your bio',
                            hintStyle: Theme
                                .of(context)
                                .textTheme
                                .titleMedium,
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
                    padding: const EdgeInsets.only(top: 30),
                    child: Button(
                        onPressed: () {
                          controller.editProfile();
                        },
                        text: "Submit"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
