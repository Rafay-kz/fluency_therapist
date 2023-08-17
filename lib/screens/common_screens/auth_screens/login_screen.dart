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
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 3),
                  child: Center(
                    child: Image(
                        image: AssetImage(fluencyTherapistLogo),
                        width: 168,
                        height: 72),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 8, right: 8, bottom: 8.0),
                  child: Text(
                    'Login',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 8),
                  child: Text("Welcome back! Let's continue",
                      style: Theme.of(context).textTheme.titleLarge),
                ),
                const SizedBox(
                  height: 20,
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
                          child: Text('Email',
                              style:
                                  Theme.of(context).textTheme.headlineSmall)),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: SizedBox(
                            width: 400,
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
                      const SizedBox(
                        height: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Password',
                            style: Theme.of(context).textTheme.headlineSmall),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: SizedBox(
                            width: 400,
                            child: Obx(() => TextFormField(
                                // cursorColor: Colors.black,
                                controller: controller.passwordTEController,
                                onSaved: (value) {
                                  controller.password = value!;
                                },
                                validator: (value) {
                                  return controller.validatePassword(value!);
                                },
                                style: TextStyle(color: AppColors.textColor),
                                decoration: InputDecoration(
                                  fillColor: AppColors.textfieldColor,
                                  filled: true,
                                  hintText: 'Enter your password',
                                  hintStyle:
                                      Theme.of(context).textTheme.titleMedium,
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
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 190, bottom: 20),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(kForgetPassScreen);
                    },
                    child: Text("Forgot Password?",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 14)),
                  ),
                ),
                Button(
                    onPressed: () {
                      controller.onLoginTap();

                    },
                    text: "Login"),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: SizedBox(
                        width: 130,
                        child: Divider(
                          color: AppColors.descriptionColor,
                          thickness: 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text("OR",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 14)),
                    ),
                    Flexible(
                      child: SizedBox(
                        width: 130,
                        child: Divider(
                          color: AppColors.descriptionColor,
                          thickness: 1,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 10, bottom: 10),
                  child: Center(
                    child: Container(
                      height: mediaQuery.size.height * 0.08,
                      width: mediaQuery.size.height * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColors.textfieldColor),
                      child: TextButton(
                          onPressed: () {
                            controller.signInWithGoogle(context);
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                });
                            //GetUtils.isLengthGreaterThan(EmailController.text, 6) ? print('email is valid') : print('email is invalid');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(googleIcon),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Login with google",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(
                                          fontSize: 15,
                                        )),
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, right: 5),
                      child: Center(
                          child: Text(
                        'New User?',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 14),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Center(
                          child: GestureDetector(
                              onTap: () {
                                Get.toNamed(kSignUpScreen);
                              },
                              child: Text(
                                'Register Here',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                        fontSize: 14,
                                        color: AppColors.primaryBlue),
                              ))),
                    ),
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
