import 'package:fluency_therapist/utils/app_colors.dart';
import 'package:fluency_therapist/utils/app_constants.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/common_screens_controller/auth_screens_controller/login_screen_controller.dart';
import '../../../custom widgets/button.dart';

//created by Bilal on 6-5-2023

class LoginScreen extends GetView<LoginScreenController> {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width * 0.88;
    final double screenHeight = MediaQuery.of(context).size.height * 0.88;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: screenWidth * 0.020),
                  child: Center(
                    child: Image(
                      image: const AssetImage(fluencyTherapistLogo),
                      width: screenWidth * 0.38,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.025),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.02,
                  ),
                  child: Text(
                    'Login',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: screenWidth * 0.058),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.02,
                      vertical: screenHeight * 0.007),
                  child: Text("Welcome back! Let's continue.",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: screenWidth * 0.041)),
                ),
                SizedBox(height: screenHeight * 0.025),
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.all(screenWidth * 0.02),
                          child: Text('Email',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(fontSize: screenWidth * 0.042))),
                      Padding(
                        padding: EdgeInsets.all(screenWidth * 0.02),
                        child: Center(
                          child: TextFormField(
                            // cursorColor: Colors.black,
                            controller: controller.emailTEController,
                            onChanged: (value) {
                              controller.email = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return null;
                              }
                              return controller.validateEmail(value);
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
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.01,
                      ),
                      Padding(
                        padding: EdgeInsets.all(screenWidth * 0.02),
                        child: Text('Password',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontSize: screenWidth * 0.042)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(screenWidth * 0.02),
                        child: Center(
                          child: Obx(() => TextFormField(
                              // cursorColor: Colors.black,
                              controller: controller.passwordTEController,
                              onChanged: (value) {
                                controller.password = value;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return null;
                                }
                                return controller.validatePassword(value);
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
                                    borderRadius: BorderRadius.circular(30),
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
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: controller.obscureText.value)),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.03,
                      vertical: screenHeight * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(kForgetPassScreen);
                        },
                        child: Text("Forgot Password?",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontSize: screenWidth * 0.034)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                Center(
                  child: Button(
                      onPressed: () {
                        controller.onLoginTap();
                      },
                      text: "Login"),
                ),
                SizedBox(height: screenHeight * 0.040),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: SizedBox(
                        width: screenWidth * 0.42,
                        child: Divider(
                          color: AppColors.descriptionColor,
                          thickness: 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.015),
                      child: Text("OR",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: screenWidth * 0.040)),
                    ),
                    Flexible(
                      child: SizedBox(
                        width: screenWidth * 0.42,
                        child: Divider(
                          color: AppColors.descriptionColor,
                          thickness: 1,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.04),
                  child: Center(
                    child: Container(
                      height: screenHeight * 0.085,
                      width: screenWidth * 0.95,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColors.textfieldColor),
                      child: TextButton(
                          onPressed: () {
                            controller.signInWithGoogle(context);
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                });
                            //GetUtils.isLengthGreaterThan(EmailController.text, 6) ? print('email is valid') : print('email is invalid');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(screenWidth * 0.02),
                                child: Image.asset(googleIcon),
                              ),
                              Padding(
                                padding: EdgeInsets.all(screenWidth * 0.02),
                                child: Text("Login with google",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(
                                          fontSize: screenWidth * 0.043,
                                        )),
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.017,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                        child: Text(
                      'New User?',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: screenWidth * 0.034),
                    )),
                    Center(
                        child: GestureDetector(
                            onTap: () {
                              Get.toNamed(kSignUpScreen);
                            },
                            child: Text(
                              ' Register Here',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                      fontSize: screenWidth * 0.034,
                                      color: AppColors.primaryBlue),
                            ))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
