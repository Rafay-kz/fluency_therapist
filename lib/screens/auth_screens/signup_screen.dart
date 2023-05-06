import 'package:fluency_therapist/controller/auth_screens_controller/signup_screen_controller.dart';
import 'package:fluency_therapist/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


//created by Bilal on 6-5-2023

class SignUpScreen extends GetView<SignupScreenController>{
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  logoWidget(),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Register',
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'FontMain'),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Enter Your Personal Information",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'FontMain',
                            fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Username',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'FontMain'),
                      textAlign: TextAlign.right,
                    ),
                  ),
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
                          controller: controller.nameTEController,
                          decoration: InputDecoration(
                              hintText: 'Username ',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100)),
                              prefixIcon: const Icon(Icons.person)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Age',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'FontMain',
                          color: Colors.black),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: SizedBox(
                        width: 400,
                        child: TextFormField(
                          controller: controller.ageTEController,
                          decoration: InputDecoration(
                              hintText: 'Age ',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100)),
                              prefixIcon: const Icon(Icons.person_2_sharp)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Email',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'FontMain'),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: SizedBox(
                        width: 400,
                        child: TextFormField(
                          controller: controller.emailTEController,
                          decoration: InputDecoration(
                              hintText: 'Email',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100)),
                              prefixIcon: const Icon(Icons.email_outlined)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Password',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'FontMain'),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: SizedBox(
                        width: 400,
                        child: Obx(
                          ()=> TextFormField(
                            controller: controller.passwordTEController,
                            decoration: InputDecoration(
                                hintText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                        controller.obscureText.value = !controller.obscureText.value;
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
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Confirm Password',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'FontMain'),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: SizedBox(
                        width: 400,
                        child: Obx(
                          ()=> TextFormField(
                            controller:controller.confirmPasswordTEController,
                            decoration: InputDecoration(
                                hintText: 'ConfirmPassword',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100)),
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                       controller.obscureText.value = !controller.obscureText.value;
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
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Container(
                        height: 70,
                        width: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
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
            ],
          ),
        ),
      ),
    );
  }

  Widget logoWidget(){
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset('assets/images/logo.jpg'),
        ),
      ),
    );
  }
}
