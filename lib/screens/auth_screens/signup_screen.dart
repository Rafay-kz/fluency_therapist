import 'package:fluency_therapist/controller/auth_screens_controller/signup_screen_controller.dart';
import 'package:fluency_therapist/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//created by Bilal on 6-5-2023

class SignUpScreen extends GetView<SignupScreenController> {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              logoWidget(),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Register',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'FontMain'),
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(right: 10, left: 10, bottom: 5, top: 5),
                child: Text("Enter Your Personal Information",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontFamily: 'FontMain',
                        fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 10, left: 10, bottom: 5, top: 5),
                child: Text(
                  'Username',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'FontMain'),
                  textAlign: TextAlign.right,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 10),
                child: Center(
                  child: TextFormField(
                    cursorColor: Colors.black,
                    controller: controller.nameTEController,
                    decoration: InputDecoration(
                        hintText: 'Username ',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: const Icon(Icons.person)),
                  ),
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(right: 10, left: 10, bottom: 5, top: 5),
                child: Text(
                  'Age',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'FontMain',
                      color: Colors.black),
                  textAlign: TextAlign.right,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 10),
                child: Center(
                  child: TextFormField(
                    controller: controller.ageTEController,
                    decoration: InputDecoration(
                        hintText: 'Age ',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: const Icon(Icons.person_2_sharp)),
                  ),
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(right: 10, left: 10, bottom: 5, top: 5),
                child: Text(
                  'Email',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'FontMain'),
                  textAlign: TextAlign.right,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 10),
                child: Center(
                  child: TextFormField(
                    controller: controller.emailTEController,
                    decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: const Icon(Icons.email_outlined)),
                  ),
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(right: 10, left: 10, bottom: 5, top: 5),
                child: Text(
                  'Password',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'FontMain'),
                  textAlign: TextAlign.right,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 10),
                child: Center(
                  child: Obx(
                    () => TextFormField(
                      controller: controller.passwordTEController,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              controller.obscureText.value =
                                  !controller.obscureText.value;
                            },
                            child: Icon(controller.obscureText.value
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          prefixIcon: const Icon(Icons.lock_open_outlined)),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: controller.obscureText.value,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(right: 10, left: 10, bottom: 5, top: 5),
                child: Text(
                  'Confirm Password',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'FontMain'),
                  textAlign: TextAlign.right,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 10),
                child: Center(
                  child: Obx(
                    () => TextFormField(
                      controller: controller.confirmPasswordTEController,
                      decoration: InputDecoration(
                          hintText: 'ConfirmPassword',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              controller.obscureText.value =
                                  !controller.obscureText.value;
                            },
                            child: Icon(controller.obscureText.value
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          prefixIcon: const Icon(Icons.lock_open_outlined)),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: controller.obscureText.value,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    height: _mediaQuery.size.height * 0.06,
                    width: _mediaQuery.size.height * 0.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue),
                    child: TextButton(
                        onPressed: () {
                          //GetUtils.isLengthGreaterThan(EmailController.text, 6) ? print('email is valid') : print('email is invalid');
                          controller.onRegisterTap();
                        },
                        child: const Center(
                            child: Text(
                          "Register",
                          style: TextStyle(
                              fontFamily: 'FontMain',
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ))),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget logoWidget() {

    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 10, bottom: 5, left: 10, right: 10),
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset('assets/images/logo.jpg'),
        ),
      ),
    );
  }
}
