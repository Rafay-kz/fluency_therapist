import 'package:fluency_therapist/controller/auth_screens_controller/signup_screen_controller.dart';
import 'package:fluency_therapist/utils/app_colors.dart';
import 'package:fluency_therapist/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import'package:fluency_therapist/utils/widgets/button.dart';

//created by Bilal on 6-5-2023

class SignUpScreen extends GetView<SignupScreenController> {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor:AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 const Padding(padding:  EdgeInsets.only(top: 30),
                  child: Center(
                    child:  Image(image:  AssetImage(fluencyTherapistLogo),
                    width: 168,
                    height: 72),
                  ),
                ),

                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Register',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 24),
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
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Username',
                    style: Theme.of(context).textTheme.headlineSmall)
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
                            fillColor: AppColors.textfieldColor,
                            filled: true,
                            hintText: 'Enter your name',
                            hintStyle: Theme.of(context).textTheme.titleMedium,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none
                            ),
                            prefixIcon:  Icon(Icons.perm_identity_rounded, color: AppColors.textHintColor, )
                        ),
                      ),
                    ),),
                ),
                const SizedBox(
                  height: 5,
                ),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Age',
                    style: Theme.of(context).textTheme.headlineSmall
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
                        controller: controller.ageTEController,
                        decoration: InputDecoration(
                          fillColor: AppColors.textfieldColor,
                          filled: true,
                          hintText: 'Enter your age',
                          hintStyle: Theme.of(context).textTheme.titleMedium,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none
                          ),
                            prefixIcon:  Icon(Icons.group_outlined, color: AppColors.textHintColor)
                        ),
                    ),
                  ),),
                ),
                  const SizedBox(
                  height: 5,
                ),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Email',
                    style:  Theme.of(context).textTheme.headlineSmall
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
                        // cursorColor: Colors.black,
                        controller: controller.emailTEController,
                        decoration: InputDecoration(
                          fillColor: AppColors.textfieldColor,
                          filled: true,
                          hintText: 'Enter your email',
                          hintStyle: Theme.of(context).textTheme.titleMedium,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none
                          ),
                            prefixIcon:  Icon(Icons.email_outlined, color: AppColors.textHintColor,),
                        ),),
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
                    style:  Theme.of(context).textTheme.headlineSmall,
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
                          // cursorColor: Colors.black,
                          controller: controller.passwordTEController,
                          decoration: InputDecoration(
                            fillColor: AppColors.textfieldColor,
                            filled: true,
                            hintText: 'Enter your password',
                            hintStyle: Theme.of(context).textTheme.titleMedium,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none
                            ),



                              prefixIcon:  Icon(Icons.lock_open_outlined, color: AppColors.textHintColor),),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: controller.obscureText.value)
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
                    style:  Theme.of(context).textTheme.headlineSmall,
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
                          // cursorColor: Colors.black,
                            controller: controller.nameTEController,
                            decoration: InputDecoration(
                              fillColor: AppColors.textfieldColor,
                              filled: true,
                              hintText: 'Confirm your password',
                              hintStyle: Theme.of(context).textTheme.titleMedium,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none
                              ),


                              suffixIcon: GestureDetector(
                                  onTap: () {
                                     controller.obscureText.value = !controller.obscureText.value;
                                  },
                                  child: Icon(controller.obscureText.value
                                      ? Icons.visibility_off
                                      : Icons.visibility, color: AppColors.textHintColor),
                                ),

                              prefixIcon:  Icon(Icons.lock_open_outlined, color: AppColors.textHintColor)),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: controller.obscureText.value,
                        ),
                      ),
                ),
                  )
                ),
    ],),),),));

  }
  }



