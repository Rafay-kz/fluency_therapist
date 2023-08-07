import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/common_screens_controller/auth_screens_controller/create_new_password_screen_controller.dart';
import '../../../custom widgets/button.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';


class CreateNewPasswordScreen
    extends GetView<CreateNewPasswordScreenController> {
  const CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(
                        top: 40,
                        right: 110,
                      ),
                      child: Text(
                        "Create new\nPassword",
                        style: Theme.of(context).textTheme.displayLarge,
                      )),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 6, right: 35, bottom: 10),
                    child: Text(
                        "Your password should be unique and\ndifferent from previous passwords to\nensure better security",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 14)),
                  ),
                  Padding(
                      padding:
                          const EdgeInsets.only(right: 175, top: 20, bottom: 5),
                      child: Text('New Password',
                          style: Theme.of(context).textTheme.headlineSmall)),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: SizedBox(
                        width: 400,
                        child: TextFormField(
                            // cursorColor: Colors.black,
                            controller: controller.passwordTEController,
                            decoration: InputDecoration(
                                fillColor: AppColors.textfieldColor,
                                filled: true,
                                hintText: 'New Password',
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
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: AppColors.textHintColor,
                                )),
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: controller.obscureText.value),
                      ),
                    ),
                  ),
                  Padding(
                      padding:
                          const EdgeInsets.only(right: 145, top: 20, bottom: 5),
                      child: Text('Confirm Password',
                          style: Theme.of(context).textTheme.headlineSmall)),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: SizedBox(
                        width: 400,
                        child: TextFormField(
                          // cursorColor: Colors.black,
                          controller: controller.confirmPasswordTEController,
                          decoration: InputDecoration(
                              fillColor: AppColors.textfieldColor,
                              filled: true,
                              hintText: 'Confirm Password',
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
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: AppColors.textHintColor,
                              )),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Button(
                        onPressed: () {
                          Get.toNamed(kLoginScreen);
                        },
                        text: "Submit",
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
