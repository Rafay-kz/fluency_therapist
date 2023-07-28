import 'package:fluency_therapist/custom%20widgets/button.dart';
import 'package:fluency_therapist/utils/app_colors.dart';
import 'package:fluency_therapist/utils/app_constants.dart';
import '../../controller/auth_screens_controller/doctor_registration_ screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../custom widgets/time_picker.dart';

class DoctorRegistrationScreen
    extends GetView<DoctorRegistrationScreenController> {
  const DoctorRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    TimeOfDay? startTime;
    TimeOfDay? endTime;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Center(
                          child: Image(
                              image: AssetImage(fluencyTherapistLogo),
                              width: 168,
                              height: 72),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Doctor Registration',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontSize: 24),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 8),
                        child: Text(
                            "Please provide details so we can \nverify and set up your profile",
                            style: Theme.of(context).textTheme.titleLarge),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Form(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          key: controller.formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Full name',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall)),
                              const SizedBox(
                                height: 2,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: SizedBox(
                                    width: width * 0.89,
                                    child: TextFormField(
                                      controller: controller.fullNameController,
                                      onSaved: (value) {
                                        controller.fullName = value!;
                                      },
                                      validator: (value) {
                                        return controller
                                            .validateFullName(value!);
                                      },
                                      decoration: InputDecoration(
                                        fillColor: AppColors.textfieldColor,
                                        filled: true,
                                        contentPadding:
                                            const EdgeInsets.only(left: 15),
                                        hintText: 'Enter your full name',
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide.none),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Speciality',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall)),
                              const SizedBox(
                                height: 2,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: SizedBox(
                                    width: width * 0.89,
                                    child: TextFormField(
                                      controller:
                                          controller.specialityController,
                                      onSaved: (value) {
                                        controller.speciality = value!;
                                      },
                                      validator: (value) {
                                        return controller
                                            .validateSpeciality(value!);
                                      },
                                      decoration: InputDecoration(
                                        fillColor: AppColors.textfieldColor,
                                        filled: true,
                                        contentPadding:
                                            const EdgeInsets.only(left: 15),
                                        hintText: 'Enter your Speciality',
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide.none),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Bio',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: SizedBox(
                                    width: width * 0.89,
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
                                        contentPadding:
                                            const EdgeInsets.all(15),
                                        hintText: 'Enter your bio',
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall)),
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall)),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: SizedBox(
                                    width: width * 0.89,
                                    child: TextFormField(
                                      controller: controller.locationController,
                                      onSaved: (value) {
                                        controller.fullName = value!;
                                      },
                                      validator: (value) {
                                        return controller
                                            .validateLocation(value!);
                                      },
                                      decoration: InputDecoration(
                                        fillColor: AppColors.textfieldColor,
                                        filled: true,
                                        contentPadding:
                                            const EdgeInsets.only(left: 15),
                                        hintText: 'Add Location or virtual',
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide.none),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      SizedBox(height: 25),
                      Button(
                          onPressed: () {

                          },
                          text: "Register")
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
