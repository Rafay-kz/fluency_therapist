import 'package:fluency_therapist/utils/app_colors.dart';
import 'package:fluency_therapist/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/common_screens_controller/auth_screens_controller/signup_screen_controller.dart';
import '../../../custom widgets/button.dart';
import '../../../custom widgets/time_picker.dart';

//created by Bilal on 6-5-2023

class SignUpScreen extends GetView<SignupScreenController> {
  const SignUpScreen({super.key});

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
                          'Register',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontSize: 24),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 8),
                        child: Text("Register now for improved communication",
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
                                child: Text('Username',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall),
                              ),
                              const SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: width * 0.89, // Set the width here
                                  child: TextFormField(
                                    controller: controller.nameTEController,
                                    onSaved: (value) {
                                      controller.name = value!;
                                    },
                                    validator: (value) {
                                      return controller.validateName(value!);
                                    },
                                    style:
                                        TextStyle(color: AppColors.textColor),
                                    decoration: InputDecoration(
                                      fillColor: AppColors.textfieldColor,
                                      filled: true,
                                      hintText: 'Enter your name',
                                      hintStyle: Theme.of(context)
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
                              const SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Age',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall),
                              ),
                              const SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: width * 0.89, // Set the width here
                                  child: TextFormField(
                                    controller: controller.ageTEController,
                                    onSaved: (value) {
                                      controller.age = value!;
                                    },
                                    validator: (value) {
                                      return controller.validateAge(value!);
                                    },
                                    decoration: InputDecoration(
                                      fillColor: AppColors.textfieldColor,
                                      filled: true,
                                      hintText: 'Enter your age',
                                      hintStyle: Theme.of(context)
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
                              const SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Email',
                                    style: Theme.of(context)
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
                                    width: width * 0.89,
                                    child: TextFormField(
                                      // cursorColor: Colors.black,
                                      controller: controller.emailTEController,
                                      onSaved: (value) {
                                        controller.email = value!;
                                      },
                                      validator: (value) {
                                        return controller.validateEmail(value!);
                                      },
                                      decoration: InputDecoration(
                                        fillColor: AppColors.textfieldColor,
                                        filled: true,
                                        hintText: 'Enter your email',
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
                              const SizedBox(
                                height: 2,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Password',
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: SizedBox(
                                    width: width * 0.89,
                                    child: Obx(
                                      () => TextFormField(
                                        // cursorColor: Colors.black,
                                        controller:
                                            controller.passwordTEController,
                                        onSaved: (value) {
                                          controller.password = value!;
                                        },
                                        validator: (value) {
                                          return controller
                                              .validatePassword(value!);
                                        },
                                        decoration: InputDecoration(
                                          fillColor: AppColors.textfieldColor,
                                          filled: true,
                                          hintText: 'Enter your password',
                                          hintStyle: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide.none),
                                          suffixIcon: GestureDetector(
                                            onTap: () {
                                              controller.obscureText.value =
                                                  !controller.obscureText.value;
                                            },
                                            child: Icon(
                                                controller.obscureText.value
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
                                                color: AppColors.textHintColor),
                                          ),
                                        ),
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        obscureText:
                                            controller.obscureText.value,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Confirm Password',
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: SizedBox(
                                    width: width * 0.89,
                                    child: Obx(
                                      () => TextFormField(
                                        // cursorColor: Colors.black,
                                        controller: controller
                                            .confirmPasswordTEController,
                                        onSaved: (value) {
                                          controller.confirmPassword = value!;
                                        },
                                        validator: (value) {
                                          return controller
                                              .validateConfirmPassword(value!);
                                        },
                                        decoration: InputDecoration(
                                          fillColor: AppColors.textfieldColor,
                                          filled: true,
                                          hintText: 'Confirm your password',
                                          hintStyle: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide.none),
                                          suffixIcon: GestureDetector(
                                            onTap: () {
                                              controller.obscureText.value =
                                                  !controller.obscureText.value;
                                            },
                                            child: Icon(
                                                controller.obscureText.value
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
                                                color: AppColors.textHintColor),
                                          ),
                                        ),
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        obscureText:
                                            controller.obscureText.value,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Obx(
                                () => CheckboxListTile(
                                  title: const Text('Sign up as a doctor'),
                                  value: controller.isDoctor.value,
                                  onChanged: (newValue) {
                                    controller.toggleDoctor(newValue!);
                                  },
                                  checkColor: AppColors.primaryBlue,
                                  activeColor: AppColors.textfieldColor,
                                ),
                              ),
                              Obx(() {
                                if (controller.isDoctor.value) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                              controller:
                                                  controller.fullNameController,
                                              onSaved: (value) {
                                                controller.fullName = value!;
                                              },
                                              validator: (value) {
                                                return controller
                                                    .validateFullName(value!);
                                              },
                                              decoration: InputDecoration(
                                                fillColor:
                                                    AppColors.textfieldColor,
                                                filled: true,
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        left: 15),
                                                hintText:
                                                    'Enter your full name',
                                                hintStyle: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium,
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    borderSide:
                                                        BorderSide.none),
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
                                              controller: controller
                                                  .specialityController,
                                              onSaved: (value) {
                                                controller.speciality = value!;
                                              },
                                              validator: (value) {
                                                return controller
                                                    .validateSpeciality(value!);
                                              },
                                              decoration: InputDecoration(
                                                fillColor:
                                                    AppColors.textfieldColor,
                                                filled: true,
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        left: 15),
                                                hintText:
                                                    'Enter your Speciality',
                                                hintStyle: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium,
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    borderSide:
                                                        BorderSide.none),
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
                                                  controller.bioController,
                                              maxLines: 4,
                                              // Limiting the user to 3 lines for the introduction
                                              onSaved: (value) {
                                                controller.bio = value!;
                                              },
                                              decoration: InputDecoration(
                                                fillColor:
                                                    AppColors.textfieldColor,
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
                                          child: Text('Availability Timing',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall)),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TimePicker(
                                            onRangeCompleted: (range) {
                                          startTime = range?.start;
                                          endTime = range?.end;
                                          if (startTime != null &&
                                              endTime != null) {
                                            // Format the TimeOfDay values as strings in the format "HH:mm"
                                            controller.availabilityStart =
                                                controller.formatTimeOfDay(
                                                    startTime!);
                                            controller.availabilityEnd =
                                                controller
                                                    .formatTimeOfDay(endTime!);
                                          } else {
                                            return;
                                          }
                                        }),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('Location',
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
                                                  controller.locationController,
                                              onSaved: (value) {
                                                controller.fullName = value!;
                                              },
                                              validator: (value) {
                                                return controller
                                                    .validateLocation(value!);
                                              },
                                              decoration: InputDecoration(
                                                fillColor:
                                                    AppColors.textfieldColor,
                                                filled: true,
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        left: 15),
                                                hintText:
                                                    'Add Location or virtual',
                                                hintStyle: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium,
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    borderSide:
                                                        BorderSide.none),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                } else {
                                  return const SizedBox.shrink();
                                }
                              }),
                            ],
                          )),
                      const SizedBox(height: 10),
                      Button(
                          onPressed: () {
                            controller.onRegisterTap();
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
