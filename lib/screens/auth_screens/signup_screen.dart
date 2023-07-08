import 'package:fluency_therapist/controller/auth_screens_controller/signup_screen_controller.dart';
import 'package:fluency_therapist/utils/app_colors.dart';
import 'package:fluency_therapist/utils/app_constants.dart';
import 'package:flutter/services.dart';
import '../../custom widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//created by Bilal on 6-5-2023

class SignUpScreen extends GetView<SignupScreenController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
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
                          child:  Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Username',
                                      style:
                                      Theme.of(context).textTheme.headlineSmall)),
                              const SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: SizedBox(
                                    width: width * 0.89,
                                    child: TextFormField(

                                      controller: controller.nameTEController,
                                      onSaved: (value) {
                                        controller.name = value!;
                                      },
                                      validator: (value) {
                                        return controller.validateName(value!);
                                      },
                                      decoration: InputDecoration(
                                          fillColor: AppColors.textfieldColor,
                                          filled: true,
                                          hintText: 'Enter your name',
                                          hintStyle:
                                          Theme.of(context).textTheme.titleMedium,
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide: BorderSide.none),
                                          prefixIcon: Icon(
                                            Icons.perm_identity_rounded,
                                            color: AppColors.textHintColor,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Age',
                                    style: Theme.of(context).textTheme.headlineSmall),
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
                                          hintStyle:
                                          Theme.of(context).textTheme.titleMedium,
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide: BorderSide.none),
                                          prefixIcon: Icon(Icons.group_outlined,
                                              color: AppColors.textHintColor)),
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
                                        hintStyle:
                                        Theme.of(context).textTheme.titleMedium,
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            borderSide: BorderSide.none),
                                        prefixIcon: Icon(
                                          Icons.email_outlined,
                                          color: AppColors.textHintColor,
                                        ),
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
                                  style: Theme.of(context).textTheme.headlineSmall,
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
                                          () => TextFormField(
                                        // cursorColor: Colors.black,
                                            controller: controller.passwordTEController,
                                            onSaved: (value) {
                                              controller.password = value!;
                                            },
                                            validator: (value) {
                                              return controller.validatePassword(value!);
                                            },
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
                                            prefixIcon: Icon(Icons.lock_open_outlined,
                                                color: AppColors.textHintColor)),
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Confirm Password',
                                  style: Theme.of(context).textTheme.headlineSmall,
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
                                          () => TextFormField(
                                        // cursorColor: Colors.black,
                                            controller: controller.confirmPasswordTEController,
                                            onSaved: (value) {
                                              controller.confirmPassword = value!;
                                            },
                                            validator: (value) {
                                              return controller.validateConfirmPassword(value!);
                                            },
                                        decoration: InputDecoration(
                                            fillColor: AppColors.textfieldColor,
                                            filled: true,
                                            hintText: 'Confirm your password',
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
                                            prefixIcon: Icon(Icons.lock_open_outlined,
                                                color: AppColors.textHintColor)),
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

                        ],)),
                        Button(
                          onPressed: () {
                            controller.onRegisterTap();
                          },
                          text: "Register",
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
