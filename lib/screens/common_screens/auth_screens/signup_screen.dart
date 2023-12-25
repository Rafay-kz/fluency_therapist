import 'package:fluency_therapist/utils/app_colors.dart';
import 'package:fluency_therapist/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/common_screens_controller/auth_screens_controller/signup_screen_controller.dart';
import '../../../custom widgets/button.dart';

//created by Bilal on 6-5-2023

class SignUpScreen extends GetView<SignupScreenController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width * 0.78;
    final double screenHeight = MediaQuery.of(context).size.height * 0.88;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 0.035),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: screenWidth * 0.020),
                        child: Center(
                          child: Image(
                              image: const AssetImage(fluencyTherapistLogo),
                            width: screenWidth * 0.38),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.020),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.02),
                        child: Text(
                          'Register',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontSize: screenWidth * 0.058),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.02,
                            vertical: screenHeight * 0.005),
                        child: Text("Register now for improved communication",
                            style: Theme.of(context).textTheme.titleLarge!
                                .copyWith(fontSize: screenWidth * 0.041)),
                      ),
                      SizedBox(height: screenHeight * 0.020),
                      Form(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          key: controller.formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(screenWidth * 0.018),
                                child: Text('First name',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!.copyWith(fontSize: screenWidth * 0.042)),
                              ),
                              Padding(
                                padding: EdgeInsets.all(screenWidth * 0.018),
                                child: Center(
                                  child: TextFormField(
                                    controller: controller.firstNameController,
                                    onSaved: (value) {
                                      controller.firstName = value!;
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
                                        contentPadding:
                                        EdgeInsets.all(screenWidth * 0.045),
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
                              Padding(
                                padding: EdgeInsets.all(screenWidth * 0.018),
                                child: Text('Last name',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!.copyWith(fontSize: screenWidth * 0.042)),
                              ),
                              Padding(
                                padding: EdgeInsets.all(screenWidth * 0.018),
                                child: TextFormField(
                                  controller: controller.lastNameController,
                                  onSaved: (value) {
                                    controller.lastName = value!;
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
                                    contentPadding:
                                    EdgeInsets.all(screenWidth * 0.045),
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

                              Padding(
                                padding: EdgeInsets.all(screenWidth * 0.018),
                                child: Text('Email',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!.copyWith(fontSize: screenWidth * 0.042),
                              ),
                              ),

                              Padding(
                                padding:  EdgeInsets.all(screenWidth*0.018),
                                child: Center(
                                  child: TextFormField(
                                    // cursorColor: Colors.black,
                                    controller: controller.emailTEController,
                                    onSaved: (value) {
                                      controller.email = value!;
                                    },
                                    validator: (value) {
                                      return controller.validateEmail(value!);
                                    },
                                    style: TextStyle(color: AppColors.textColor),
                                    decoration: InputDecoration(
                                      fillColor: AppColors.textfieldColor,
                                      filled: true,
                                      hintText: 'Enter your email',
                                      contentPadding:
                                      EdgeInsets.all(screenWidth * 0.045),
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(fontSize: screenWidth * 0.034),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide: BorderSide.none),
                                    ),
                                  ),
                                ),
                              ),

                              Padding(
                                padding:  EdgeInsets.all(screenWidth*0.018),
                                child: Text(
                                  'Password',
                                  style:
                                      Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: screenWidth * 0.042),

                              ),
                              ),

                              Padding(
                                padding:  EdgeInsets.all(screenWidth*0.018),
                                child: Center(
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
                                      style: TextStyle(color: AppColors.textColor),
                                      decoration: InputDecoration(
                                        fillColor: AppColors.textfieldColor,
                                        filled: true,
                                        hintText: 'Enter your password',
                                        contentPadding:
                                        EdgeInsets.all(screenWidth * 0.045),
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(fontSize: screenWidth * 0.034),
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
                              Padding(
                                padding:  EdgeInsets.all(screenWidth*0.018),
                                child: Text(
                                  'Confirm Password',
                                  style:
                                      Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: screenWidth * 0.042),

                              ),
                              ),

                              Padding(
                                padding:  EdgeInsets.all(screenWidth*0.018),
                                child: Center(
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
                                      style: TextStyle(color: AppColors.textColor),
                                      decoration: InputDecoration(
                                        fillColor: AppColors.textfieldColor,
                                        filled: true,
                                        hintText: 'Confirm your password',
                                        contentPadding:
                                        EdgeInsets.all(screenWidth * 0.045),
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(fontSize: screenWidth * 0.034),
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
                              Obx(
                                () => Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.02),
                                  child: CheckboxListTile(
                                    title:  Text('Sign up as a doctor', style: Theme.of(context)
                                        .textTheme.headlineSmall!.copyWith(fontSize: screenWidth * 0.042, color: AppColors.textHintColor)),
                                    value: controller.isDoctor.value,
                                    onChanged: (newValue) {
                                      controller.toggleDoctor(newValue!);
                                    },
                                    contentPadding: EdgeInsets.zero,
                                    checkColor: AppColors.primaryBlue,
                                    activeColor: AppColors.textfieldColor,
                                  ),
                                ),
                              ),
                            ],
                          )),
                       SizedBox(height: screenHeight*0.010),
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




// Obx(() {
//   if (controller.isDoctor.value) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment:
//           CrossAxisAlignment.start,
//       children: [
//         Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text('Full name',
//                 style: Theme.of(context)
//                     .textTheme
//                     .headlineSmall)),
//         const SizedBox(
//           height: 2,
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Center(
//             child: SizedBox(
//               width: width * 0.89,
//               child: TextFormField(
//                 controller:
//                     controller.fullNameController,
//                 onSaved: (value) {
//                   controller.fullName = value!;
//                 },
//                 validator: (value) {
//                   return controller
//                       .validateFullName(value!);
//                 },
//                 style: TextStyle(color: AppColors.textColor),
//                 decoration: InputDecoration(
//                   fillColor:
//                       AppColors.textfieldColor,
//                   filled: true,
//                   contentPadding:
//                       const EdgeInsets.only(
//                           left: 15),
//                   hintText:
//                       'Enter your full name',
//                   hintStyle: Theme.of(context)
//                       .textTheme
//                       .titleMedium,
//                   border: OutlineInputBorder(
//                       borderRadius:
//                           BorderRadius.circular(
//                               30),
//                       borderSide:
//                           BorderSide.none),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text('Speciality',
//                 style: Theme.of(context)
//                     .textTheme
//                     .headlineSmall)),
//         const SizedBox(
//           height: 2,
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Center(
//             child: SizedBox(
//               width: width * 0.89,
//               child: TextFormField(
//                 controller: controller
//                     .specialityController,
//                 onSaved: (value) {
//                   controller.speciality = value!;
//                 },
//                 validator: (value) {
//                   return controller
//                       .validateSpeciality(value!);
//                 },
//                 style: TextStyle(color: AppColors.textColor),
//                 decoration: InputDecoration(
//                   fillColor:
//                       AppColors.textfieldColor,
//                   filled: true,
//                   contentPadding:
//                       const EdgeInsets.only(
//                           left: 15),
//                   hintText:
//                       'Enter your Speciality',
//                   hintStyle: Theme.of(context)
//                       .textTheme
//                       .titleMedium,
//                   border: OutlineInputBorder(
//                       borderRadius:
//                           BorderRadius.circular(
//                               30),
//                       borderSide:
//                           BorderSide.none),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text('Bio',
//               style: Theme.of(context)
//                   .textTheme
//                   .headlineSmall),
//         ),
//         const SizedBox(
//           height: 2,
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Center(
//             child: SizedBox(
//               width: width * 0.89,
//               child: TextFormField(
//                 controller:
//                     controller.bioTEController,
//                 maxLines: 4,
//                 // Limiting the user to 3 lines for the introduction
//                 onSaved: (value) {
//                   controller.bio = value!;
//                 },
//                 style: TextStyle(color: AppColors.textColor),
//                 decoration: InputDecoration(
//                   fillColor:
//                       AppColors.textfieldColor,
//                   filled: true,
//                   contentPadding:
//                       const EdgeInsets.all(15),
//                   hintText: 'Enter your bio',
//                   hintStyle: Theme.of(context)
//                       .textTheme
//                       .titleMedium,
//                   border: OutlineInputBorder(
//                     borderRadius:
//                         BorderRadius.circular(30),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//
//         Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text('Location',
//                 style: Theme.of(context)
//                     .textTheme
//                     .headlineSmall)),
//         const SizedBox(
//           height: 2,
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Center(
//             child: SizedBox(
//               width: width * 0.89,
//               child: TextFormField(
//                 controller:
//                     controller.locationController,
//                 onSaved: (value) {
//                   controller.fullName = value!;
//                 },
//                 validator: (value) {
//                   return controller
//                       .validateLocation(value!);
//                 },
//                 style: TextStyle(color: AppColors.textColor),
//                 decoration: InputDecoration(
//                   fillColor:
//                       AppColors.textfieldColor,
//                   filled: true,
//                   contentPadding:
//                       const EdgeInsets.only(
//                           left: 15),
//                   hintText:
//                       'Add Location or virtual',
//                   hintStyle: Theme.of(context)
//                       .textTheme
//                       .titleMedium,
//                   border: OutlineInputBorder(
//                       borderRadius:
//                           BorderRadius.circular(
//                               30),
//                       borderSide:
//                           BorderSide.none),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   } else {
//     return const SizedBox.shrink();
//   }
// }),