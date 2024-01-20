import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../custom widgets/button.dart';
import '../../../utils/app_colors.dart';
import '../../controller/doctor_screens_controller/doctor_profile_setup_screen_controller.dart';
import '../../utils/app_constants.dart';

class DoctorProfileSetUpScreen
    extends GetView<DoctorProfileSetUpScreenController> {
  const DoctorProfileSetUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width * 0.88;
    final double screenHeight = MediaQuery.of(context).size.height * 0.88;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(screenWidth*0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image(
                    image: const AssetImage(fluencyTherapistLogo),
                    width: screenWidth * 0.38,
                  ),
                ),

                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(screenWidth * 0.02),
                            child: Text('Specialization',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(fontSize: screenWidth * 0.042)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(screenWidth * 0.02),
                        child: Center(
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
                              hintText: 'Enter your specialization',
                              contentPadding: EdgeInsets.all(screenWidth * 0.045),
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontSize: screenWidth * 0.034),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(screenWidth * 0.02),
                            child: Text('Location',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(fontSize: screenWidth * 0.042)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(screenWidth * 0.02),
                        child: Center(
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
                              hintText: 'Enter your Location',
                              contentPadding: EdgeInsets.all(screenWidth * 0.045),
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontSize: screenWidth * 0.034),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(screenWidth * 0.02),
                            child: Text('Bio',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(fontSize: screenWidth * 0.042)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(screenWidth * 0.02),
                        child: Center(
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
                              hintText: 'Enter your bio',
                              contentPadding: EdgeInsets.all(screenWidth * 0.045),
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontSize: screenWidth * 0.034),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
                SizedBox(height: screenHeight*0.015,),
                Text('Licenses',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontSize: screenWidth * 0.042)),
                SizedBox(height: 2,),

                Text('Please upload your documents for verification',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontSize: screenWidth * 0.028)),
                SizedBox(height: screenHeight*0.015,),



                Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    onPressed: () {
                      controller.imagePickerOption();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(AppColors.primaryBlue), // Set the button background color
                      padding: MaterialStateProperty.all(EdgeInsets.all(10.0)), // Adjust padding
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0), // Adjust border radius// Set border color
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.file_upload, color: Colors.white), // Add an icon (you can change the icon)
                        const SizedBox(width: 8.0), // Add some space between the icon and text
                        const Text(
                          "Upload Document",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.05),
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
    );
  }
}
